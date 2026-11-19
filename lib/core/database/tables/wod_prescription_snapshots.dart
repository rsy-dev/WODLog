import 'package:drift/drift.dart';

import 'workout_blocks.dart';

class WodPrescriptionSnapshots extends Table {
  TextColumn get blockId =>
      text().references(WorkoutBlocks, #id, onDelete: KeyAction.cascade)();
  TextColumn get payload => text()();

  @override
  Set<Column<Object>> get primaryKey => {blockId};
}
