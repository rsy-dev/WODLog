import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../../workout/data/wod_prescription.dart';

enum WorkoutBackupError { invalidFormat, unsupportedVersion, duplicateRecord }

/// The reason is safe to use as a UI message key.
class WorkoutBackupException implements Exception {
  const WorkoutBackupException(this.reason);

  final WorkoutBackupError reason;

  @override
  String toString() => 'WorkoutBackupException(${reason.name})';
}

/// Local JSON boundary for workout records. The caller owns file access and
/// must confirm the full replacement before calling [restoreJson].
class WorkoutBackup {
  WorkoutBackup(this._db) {
    // Version 1 uses the schema-2 workout columns. A DB schema change must
    // explicitly keep or migrate this wire format before enabling backups.
    if (_db.schemaVersion != 2) {
      throw StateError('Workout backup requires a schema-2 adapter');
    }
  }

  static const _format = 'wodlog-workout-backup';
  static const _version = 1;

  final AppDatabase _db;

  List<_BackupTable<DataClass>> get _tables => [
    _BackupTable<WorkoutSession>(_db.workoutSessions),
    _BackupTable<Exercise>(_db.exercises),
    _BackupTable<WorkoutBlock>(_db.workoutBlocks),
    _BackupTable<WorkoutExercise>(_db.workoutExercises),
    _BackupTable<PerformedSet>(_db.performedSets),
    _BackupTable<WodResult>(_db.wodResults),
    _BackupTable<WodPrescriptionSnapshot>(_db.wodPrescriptionSnapshots),
  ];

  /// Reads one consistent snapshot even if other operations write concurrently.
  Future<String> exportJson() => _db.transaction(() async {
    final tables = <String, Object?>{};
    for (final entry in _tables) {
      final table = entry.table;
      final key = table.$primaryKey.single;
      final rows = await (_db.select(
        table,
      )..orderBy([(_) => OrderingTerm.asc(key)])).get();
      tables[table.actualTableName] = rows.map((row) {
        final columns = (row as Insertable<DataClass>).toColumns(false);
        return columns.map((name, expression) {
          return MapEntry(name, (expression as Variable).value);
        });
      }).toList();
    }
    return jsonEncode({
      'format': _format,
      'version': _version,
      'tables': tables,
    });
  });

  /// Checks the backup without opening or writing the database.
  void validateJson(String source) => _decode(source);

  /// Validates all records before replacing the current workout data.
  /// Any database failure rolls back the entire replacement.
  Future<void> restoreJson(String source) async {
    final rows = _decode(source);
    final tables = _tables;
    await _db.transaction(() async {
      for (final table in tables.reversed) {
        await _db.delete(table.table).go();
      }
      for (final table in tables) {
        await _db.batch((batch) {
          table.insert(batch, rows[table.table.actualTableName]!);
        });
      }
    });
  }

  Map<String, List<Map<String, Expression>>> _decode(String source) {
    final envelope = _object(_parse(source));
    if (envelope['format'] != _format || envelope['version'] is! int) {
      _invalid();
    }
    if (envelope['version'] != _version) {
      throw const WorkoutBackupException(WorkoutBackupError.unsupportedVersion);
    }
    final data = _object(envelope['tables']);
    final tables = _tables;
    if (data.length != tables.length) _invalid();

    final primaryKeys = <String, Set<Object?>>{};
    final resultBlocks = <Object?>{};
    final setNumbers = <(Object?, Object?)>{};
    final decoded = <String, List<Map<String, Expression>>>{};
    for (final entry in tables) {
      final table = entry.table;
      final name = table.actualTableName;
      final rows = data[name];
      if (rows is! List) _invalid();
      final keys = primaryKeys[name] = {};
      decoded[name] = rows.map((value) {
        final row = _object(value);
        if (row.length != table.$columns.length) _invalid();
        final columns = <String, Expression>{};
        for (final column in table.$columns) {
          if (!row.containsKey(column.name)) _invalid();
          columns[column.name] = _variable(column, row[column.name]);
        }

        _unique(keys, row[table.$primaryKey.single.name]);
        switch (name) {
          case 'workout_blocks':
            _reference(primaryKeys, 'workout_sessions', row['session_id']);
          case 'workout_exercises':
            _reference(primaryKeys, 'workout_blocks', row['block_id']);
            if (row['exercise_id'] != null) {
              _reference(primaryKeys, 'exercises', row['exercise_id']);
            }
          case 'performed_sets':
            final exerciseId = row['workout_exercise_id'];
            _reference(primaryKeys, 'workout_exercises', exerciseId);
            _unique(setNumbers, (exerciseId, row['set_number']));
          case 'wod_results':
            final blockId = row['block_id'];
            _reference(primaryKeys, 'workout_blocks', blockId);
            _unique(resultBlocks, blockId);
            final outcome = row['outcome'];
            if (outcome != null &&
                !WodOutcome.values.any((value) => value.name == outcome)) {
              _invalid();
            }
          case 'wod_prescription_snapshots':
            _reference(primaryKeys, 'workout_blocks', row['block_id']);
            _validatePrescription(row['payload'] as String);
        }
        return columns;
      }).toList();
    }
    return decoded;
  }

  static Variable _variable(GeneratedColumn column, Object? value) {
    if (value == null && !column.$nullable) _invalid();
    return switch (column.type) {
      DriftSqlType.string when value == null || value is String =>
        Variable<String>(value as String?),
      DriftSqlType.int when value == null || value is int => Variable<int>(
        value as int?,
      ),
      DriftSqlType.double
          when value == null || (value is num && value.isFinite) =>
        Variable<double>((value as num?)?.toDouble()),
      DriftSqlType.bool when value == null || value is bool => Variable<bool>(
        value as bool?,
      ),
      _ => _invalid(),
    };
  }

  static Map<String, dynamic> _object(Object? value) =>
      value is Map<String, dynamic> ? value : _invalid();

  static Object? _parse(String source) {
    try {
      return jsonDecode(source);
    } on FormatException {
      _invalid();
    }
  }

  static void _validatePrescription(String source) {
    try {
      WodPrescription.fromJson(_object(_parse(source)));
    } on ArgumentError {
      _invalid();
    } on TypeError {
      _invalid();
    }
  }

  static void _reference(
    Map<String, Set<Object?>> primaryKeys,
    String table,
    Object? key,
  ) {
    if (!primaryKeys[table]!.contains(key)) _invalid();
  }

  static void _unique<T>(Set<T> keys, T key) {
    if (!keys.add(key)) {
      throw const WorkoutBackupException(WorkoutBackupError.duplicateRecord);
    }
  }

  static Never _invalid() =>
      throw const WorkoutBackupException(WorkoutBackupError.invalidFormat);
}

class _BackupTable<T extends DataClass> {
  const _BackupTable(this.table);

  final TableInfo<Table, T> table;

  void insert(Batch batch, List<Map<String, Expression>> rows) {
    batch.insertAll(table, rows.map(RawValuesInsertable<T>.new));
  }
}
