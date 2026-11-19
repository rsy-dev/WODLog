enum WodStructure { unknown, forTime, amrap, emom, intervals, other }

enum WodScoreKind {
  unknown,
  time,
  reps,
  roundsAndReps,
  intervals,
  distance,
  calories,
  weight,
  points,
}

enum WodVersion { unknown, rx, scaled, foundations, custom }

enum WodOutcome { unknown, completed, capped, stopped }

enum WodQuantityUnit { reps, meters, calories, seconds }

class WodMovementPrescription {
  const WodMovementPrescription({
    required this.name,
    this.movementId,
    this.quantities = const [],
    this.unit = WodQuantityUnit.reps,
    this.weightKg,
    this.equipment,
    this.interval,
    this.standard,
    this.options = const [],
  });

  final String name;
  final String? movementId;
  final List<num> quantities;
  final WodQuantityUnit unit;
  final double? weightKg;
  final String? equipment;
  final int? interval;
  final String? standard;
  final List<String> options;

  Map<String, Object?> toJson() => {
    'name': name,
    'movementId': movementId,
    'quantities': quantities,
    'unit': unit.name,
    'weightKg': weightKg,
    'equipment': equipment,
    'interval': interval,
    'standard': standard,
    'options': options,
  };

  factory WodMovementPrescription.fromJson(Map<String, dynamic> json) =>
      WodMovementPrescription(
        name: json['name'] as String,
        movementId: json['movementId'] as String?,
        quantities: List<num>.unmodifiable(json['quantities'] as List),
        unit: WodQuantityUnit.values.byName(json['unit'] as String),
        weightKg: (json['weightKg'] as num?)?.toDouble(),
        equipment: json['equipment'] as String?,
        interval: json['interval'] as int?,
        standard: json['standard'] as String?,
        options: List<String>.unmodifiable(json['options'] as List),
      );
}

/// Shared editor input. A draft can be parsed, selected, or copied without writing.
class WodPrescription {
  const WodPrescription({
    required this.title,
    this.structure = WodStructure.unknown,
    this.scoreKind = WodScoreKind.unknown,
    this.sourceCollection,
    this.sourceVersion,
    this.version = WodVersion.unknown,
    this.movements = const [],
    this.rounds,
    this.intervalSeconds,
    this.intervalCount,
    this.timeCapSeconds,
    this.durationSeconds,
    this.standards = const [],
    this.rawText,
    this.unparsedLines = const [],
    this.parserVersion,
  });

  final String title;
  final WodStructure structure;
  final WodScoreKind scoreKind;
  final String? sourceCollection;
  final String? sourceVersion;
  final WodVersion version;
  final List<WodMovementPrescription> movements;
  final int? rounds;
  final int? intervalSeconds;
  final int? intervalCount;
  final int? timeCapSeconds;
  final int? durationSeconds;
  final List<String> standards;
  final String? rawText;
  final List<String> unparsedLines;
  final String? parserVersion;

  Map<String, Object?> toJson() => {
    'title': title,
    'structure': structure.name,
    'scoreKind': scoreKind.name,
    'sourceCollection': sourceCollection,
    'sourceVersion': sourceVersion,
    'version': version.name,
    'movements': movements.map((movement) => movement.toJson()).toList(),
    'rounds': rounds,
    'intervalSeconds': intervalSeconds,
    'intervalCount': intervalCount,
    'timeCapSeconds': timeCapSeconds,
    'durationSeconds': durationSeconds,
    'standards': standards,
    'rawText': rawText,
    'unparsedLines': unparsedLines,
    'parserVersion': parserVersion,
  };

  factory WodPrescription.fromJson(Map<String, dynamic> json) =>
      WodPrescription(
        title: json['title'] as String,
        structure: WodStructure.values.byName(json['structure'] as String),
        scoreKind: WodScoreKind.values.byName(json['scoreKind'] as String),
        sourceCollection: json['sourceCollection'] as String?,
        sourceVersion: json['sourceVersion'] as String?,
        version: WodVersion.values.byName(json['version'] as String),
        movements: List.unmodifiable(
          (json['movements'] as List).map(
            (item) =>
                WodMovementPrescription.fromJson(item as Map<String, dynamic>),
          ),
        ),
        rounds: json['rounds'] as int?,
        intervalSeconds: json['intervalSeconds'] as int?,
        intervalCount: json['intervalCount'] as int?,
        timeCapSeconds: json['timeCapSeconds'] as int?,
        durationSeconds: json['durationSeconds'] as int?,
        standards: List<String>.unmodifiable(json['standards'] as List),
        rawText: json['rawText'] as String?,
        unparsedLines: List<String>.unmodifiable(json['unparsedLines'] as List),
        parserVersion: json['parserVersion'] as String?,
      );
}

class WodAttemptScore {
  const WodAttemptScore({
    required this.outcome,
    this.elapsedMs,
    this.rounds,
    this.reps,
    this.value,
    this.tieBreakMs,
    this.text,
    this.notes,
  });
  final WodOutcome outcome;
  final int? elapsedMs;
  final int? rounds;
  final int? reps;

  /// Intervals, meters, calories, kilograms, or points, per score kind.
  final double? value;
  final int? tieBreakMs;
  final String? text;
  final String? notes;

  void validate(WodScoreKind kind) {
    final counts = [elapsedMs, rounds, reps, tieBreakMs].whereType<int>();
    if (counts.any((count) => count < 0) ||
        (value != null && (!value!.isFinite || value! < 0))) {
      throw ArgumentError('Score numbers must be finite and nonnegative');
    }
    if (outcome == WodOutcome.unknown ||
        (kind != WodScoreKind.time && tieBreakMs != null)) {
      throw ArgumentError('Choose an outcome and a compatible tiebreak');
    }
    final valid = switch (kind) {
      WodScoreKind.time when outcome == WodOutcome.completed =>
        (elapsedMs ?? 0) > 0 && rounds == null && reps == null && value == null,
      WodScoreKind.time =>
        elapsedMs == null &&
            rounds == null &&
            value == null &&
            (outcome == WodOutcome.stopped || reps != null),
      WodScoreKind.roundsAndReps =>
        rounds != null && reps != null && elapsedMs == null && value == null,
      WodScoreKind.reps =>
        reps != null && rounds == null && elapsedMs == null && value == null,
      WodScoreKind.intervals || WodScoreKind.calories =>
        value != null &&
            value == value!.truncateToDouble() &&
            elapsedMs == null &&
            rounds == null &&
            reps == null,
      WodScoreKind.distance || WodScoreKind.weight || WodScoreKind.points =>
        value != null && elapsedMs == null && rounds == null && reps == null,
      WodScoreKind.unknown => false,
    };
    if (!valid) throw ArgumentError('Score does not match its scoring rule');
  }
}
