import 'package:drift/drift.dart';

class Exercises extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get normalizedName => text().named('normalized_name')();
  TextColumn get unitType =>
      text().named('unit_type').withDefault(const Constant('weight'))();
  IntColumn get createdAt => integer().named('created_at')();
  IntColumn get archivedAt => integer().named('archived_at').nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
