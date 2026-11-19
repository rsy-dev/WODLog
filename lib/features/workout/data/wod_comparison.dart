import 'dart:convert';

import 'wod_prescription.dart';
import 'wod_repository.dart';

typedef WodPersonalBest = ({WodRecord best, List<WodRecord> improvements});

String? wodComparisonKey(WodRecord record) {
  final prescription = record.prescription;
  final result = record.result;
  if (result == null ||
      prescription.version == WodVersion.unknown ||
      prescription.structure == WodStructure.unknown ||
      prescription.scoreKind == WodScoreKind.unknown ||
      prescription.movements.isEmpty ||
      prescription.unparsedLines.isNotEmpty ||
      prescription.movements.any(
        (movement) =>
            movement.movementId == null ||
            movement.quantities.isEmpty ||
            (movement.options.isNotEmpty &&
                movement.weightKg == null &&
                movement.standard == null),
      ) ||
      result.resultType != prescription.scoreKind.name ||
      (record.outcome != WodOutcome.completed &&
          !(record.outcome == WodOutcome.capped &&
              prescription.scoreKind == WodScoreKind.time))) {
    return null;
  }
  if (prescription.structure == WodStructure.emom &&
      (prescription.intervalCount == null ||
          prescription.intervalSeconds == null)) {
    return null;
  }
  final validScore = switch (prescription.scoreKind) {
    WodScoreKind.time =>
      record.outcome == WodOutcome.completed
          ? (result.durationMs ?? 0) > 0
          : result.extraReps != null,
    WodScoreKind.roundsAndReps =>
      result.rounds != null && result.extraReps != null,
    WodScoreKind.reps => result.extraReps != null,
    _ => result.scoreValue != null,
  };
  if (!validScore) return null;
  return jsonEncode({
    'structure': prescription.structure.name,
    'scoreKind': prescription.scoreKind.name,
    'version': prescription.version.name,
    'rounds': prescription.rounds,
    'intervalSeconds': prescription.intervalSeconds,
    'intervalCount': prescription.intervalCount,
    'timeCapSeconds': prescription.timeCapSeconds,
    'durationSeconds': prescription.durationSeconds,
    'standards': prescription.standards,
    'movements': [
      for (final movement in prescription.movements)
        [
          movement.movementId,
          movement.quantities.map((number) => number.toDouble()).toList(),
          movement.unit.name,
          movement.weightKg,
          movement.equipment,
          movement.interval,
          movement.standard,
        ],
    ],
  });
}

int _compare(WodRecord candidate, WodRecord best) {
  final a = candidate.result!;
  final b = best.result!;
  switch (candidate.prescription.scoreKind) {
    case WodScoreKind.time:
      final aFinished = candidate.outcome == WodOutcome.completed;
      final bFinished = best.outcome == WodOutcome.completed;
      if (aFinished != bFinished) return aFinished ? 1 : -1;
      if (aFinished) return b.durationMs!.compareTo(a.durationMs!);
      final reps = a.extraReps!.compareTo(b.extraReps!);
      if (reps != 0) return reps;
      final aTie = a.tieBreakMs;
      final bTie = b.tieBreakMs;
      return aTie != null && aTie > 0 && bTie != null && bTie > 0
          ? bTie.compareTo(aTie)
          : 0;
    case WodScoreKind.roundsAndReps:
      final rounds = a.rounds!.compareTo(b.rounds!);
      return rounds == 0 ? a.extraReps!.compareTo(b.extraReps!) : rounds;
    case WodScoreKind.reps:
      return a.extraReps!.compareTo(b.extraReps!);
    default:
      return a.scoreValue!.compareTo(b.scoreValue!);
  }
}

List<WodPersonalBest> wodPersonalBests(Iterable<WodRecord> chronological) {
  final groups = <String, WodPersonalBest>{};
  for (final record in chronological) {
    final key = wodComparisonKey(record);
    if (key == null) continue;
    final previous = groups[key];
    if (previous == null) {
      groups[key] = (best: record, improvements: []);
    } else if (_compare(record, previous.best) > 0) {
      groups[key] = (
        best: record,
        improvements: [...previous.improvements, record],
      );
    }
  }
  return groups.values.toList();
}
