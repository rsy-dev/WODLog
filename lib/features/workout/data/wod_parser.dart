import 'crossfit_catalog.dart';
import 'wod_prescription.dart';

/// The workout structure inferred from text, not a confirmed workout record.
enum WodFormat { amrap, forTime, emom, unknown }

/// A conservatively parsed movement line that still needs user review.
class WodMovementDraft {
  const WodMovementDraft({
    required this.name,
    required this.rawLine,
    required this.confidence,
    this.repScheme,
    this.weight,
    this.weightUnit,
    this.quantity,
    this.quantityUnit,
  });

  final String name;
  final String rawLine;
  final List<int>? repScheme;
  final double? weight;
  final String? weightUnit;
  final double? quantity;
  final String? quantityUnit;

  /// A heuristic confidence score from 0 to 1. It is not a probability.
  final double confidence;
}

/// Editable, unsaved interpretation of OCR text.
class WodDraft {
  WodDraft({
    required this.rawText,
    required this.format,
    required this.movements,
    required this.unknownLines,
    required this.confidence,
    this.durationMinutes,
    this.timeCapMinutes,
    this.rounds,
    this.levels = const [],
  });

  final String rawText;
  final WodFormat format;
  final int? durationMinutes;
  final int? timeCapMinutes;
  final int? rounds;
  final List<WodLevelDraft> levels;
  final List<WodMovementDraft> movements;
  final List<String> unknownLines;

  /// A heuristic score from 0 to 1. OCR or parsing confidence never confirms
  /// the record; the user must review and save the draft explicitly.
  final double confidence;

  bool get requiresReview => true;
}

/// A box's original label and the prescription written for that level.
class WodLevelDraft {
  const WodLevelDraft({required this.label, required this.prescription});

  final String label;
  final WodDraft prescription;
}

/// Parses common WOD headings and explicit movement lines from OCR text.
///
/// The parser intentionally preserves lines it cannot interpret. It never
/// writes to the database and does not infer a movement from a bare number.
class WodTextParser {
  const WodTextParser();

  static const _levelName =
      r"(?:Rx(?:['’]d)?(?:\s*\+)?|Scaled|Foundations?|"
      r"Beginner|Intermediate|Advanced|Performance|Fitness|Wellness|"
      r"입문|초급|중급|상급|스케일(?:드)?|(?:Lv\.?|Level|레벨)\s*[1-9]\d*)";
  static final _levelHeading = _heading(
    _levelName +
        r"""(?:\s*[-–—·]\s*(?:Level|Lv\.?|레벨)\s*[1-9]\d*|\s+['“"]Rx['”"])?""",
    caseSensitive: false,
  );
  static final _letterLevel = _heading(r'[ABC](?:\s*(?:Level|레벨))?');

  static RegExp _heading(String label, {bool caseSensitive = true}) => RegExp(
    r'^(?:#{1,6}\s+)?(\[' + label + r'\]|' + label + r')(?:\s*[:：]\s*(.*))?$',
    caseSensitive: caseSensitive,
  );
  static final _roundsPattern = RegExp(
    r'^(\d+)\s*(?:rounds?|라운드)\s+(?:for\s+time|RFT)\b|^(\d+)\s*RFT\b',
    caseSensitive: false,
  );
  static final _amrapPattern = RegExp(
    r'(?:(\d+)\s*(?:min(?:ute)?s?|분)\s*)?\bAMRAP\b(?:\s*(\d+)\s*(?:min(?:ute)?s?|분)?)?',
    caseSensitive: false,
  );
  static final _emomPattern = RegExp(
    r'\bEMOM\b\s*(\d+)?\s*(?:min(?:ute)?s?|분)?|Every\s+Minute\s+on\s+the\s+Minute\s*(?:x\s*)?(\d+)',
    caseSensitive: false,
  );
  static final _forTimePattern = RegExp(
    r'\bFOR\s+TIME\b',
    caseSensitive: false,
  );
  static final _timeCapPattern = RegExp(
    r'(?:cap|time\s*cap|제한\s*시간)\s*[:(]?\s*(\d+)\s*(?:min(?:ute)?s?|분)?',
    caseSensitive: false,
  );
  static final _durationPattern = RegExp(
    r'^(\d+)\s*(?:min(?:ute)?s?|분)\s*(?:AMRAP|EMOM)?$',
    caseSensitive: false,
  );
  static final _weightPattern = RegExp(
    r'(?<![\d/])(\d+(?:[.,]\d+)?)\s*(kg|kgs|kilograms?|lb|lbs|pounds?)\b',
    caseSensitive: false,
  );
  static final _ambiguousLoadPattern = RegExp(r'\d+\s*/\s*\d+');
  static final _repSchemes = RegExp(r'^\s*(\d+(?:\s*[-–]\s*\d+)+)\s+(.+)$');
  static final _explicitReps = RegExp(
    r'^\s*(\d+)\s*(?:x|×)\s+(.+)$',
    caseSensitive: false,
  );
  static final _repsWord = RegExp(
    r'^\s*(\d+)\s+(?:reps?\s+of\s+)?(.+)$',
    caseSensitive: false,
  );
  static final _measuredMovement = RegExp(
    r'^(\d+(?:[.,]\d+)?)\s*[-–]?\s*(km|m|meters?|metres?|mi|miles?|cal(?:orie)?s?)\s+(.+)$',
    caseSensitive: false,
  );

  /// Parses pasted text into the shared editor model.
  WodPrescription parsePrescription(String rawText, {String title = ''}) {
    final movements = <WodMovementPrescription>[];
    final unparsed = <String>[];
    final standards = <String>[];
    var structure = WodStructure.unknown;
    int? rounds;
    int? intervalSeconds;
    int? durationSeconds;
    int? timeCapSeconds;
    List<num> scheme = const [];
    int? interval;
    for (final rawLine in rawText.split(RegExp(r'\r\n?|\n'))) {
      final line = rawLine.trim();
      if (line.isEmpty) continue;
      final cap = _pasteCap.firstMatch(line);
      if (cap != null) {
        final minutes = _positiveInt(cap[1]);
        timeCapSeconds = minutes == null
            ? null
            : minutes * 60 + (int.tryParse(cap[2] ?? '') ?? 0);
      }
      final withoutCap = cap == null
          ? line
          : line
                .substring(0, cap.start)
                .replaceFirst(RegExp(r'[\s(:,-]+$'), '');
      if (withoutCap.isEmpty && cap != null) continue;

      final intervalHeader = _intervalHeader.firstMatch(withoutCap);
      if (intervalHeader != null && structure == WodStructure.unknown) {
        structure = WodStructure.intervals;
        rounds = _positiveInt(intervalHeader[1]);
        final minutes = _positiveInt(intervalHeader[2]);
        intervalSeconds = minutes == null ? null : minutes * 60;
        continue;
      }

      final header = _pasteHeader.firstMatch(withoutCap);
      if (header != null) {
        if (structure != WodStructure.unknown) {
          unparsed.add(rawLine);
          continue;
        }
        final kind = header[3]!.toLowerCase();
        if (kind == 'for time' || kind == 'rft' || kind.contains('rounds')) {
          structure = WodStructure.forTime;
          rounds = _positiveInt(header[2] ?? header[5]);
        } else if (kind == 'amrap') {
          structure = WodStructure.amrap;
          durationSeconds = _positiveInt(header[1] ?? header[5]);
        } else {
          structure = kind.startsWith('interval')
              ? WodStructure.intervals
              : WodStructure.emom;
          rounds = structure == WodStructure.intervals
              ? _positiveInt(header[2])
              : null;
          final cadence = _positiveInt(header[4]);
          intervalSeconds = cadence == null
              ? (kind == 'emom' ? 60 : null)
              : cadence * 60;
          durationSeconds = _positiveInt(header[1] ?? header[5]);
        }
        if (durationSeconds != null) durationSeconds *= 60;
        continue;
      }
      if (cap != null) {
        unparsed.add(rawLine);
        continue;
      }
      if (_standaloneScheme.hasMatch(line)) {
        scheme = line
            .split(RegExp(r'\s*[-–]\s*'))
            .map(int.tryParse)
            .whereType<int>()
            .toList();
        continue;
      }
      if (_reviewLine.hasMatch(line)) {
        unparsed.add(rawLine);
        standards.add(rawLine);
        scheme = const [];
        interval = null;
        continue;
      }
      final slot = _minuteSlot.firstMatch(line);
      if (slot != null) interval = _positiveInt(slot[1]);
      final body = slot == null ? line : line.substring(slot.end);
      final movement = _pasteMovement(body, scheme, interval, rawLine);
      if (movement == null ||
          movement.movementId == null ||
          movement.options.isNotEmpty) {
        unparsed.add(rawLine);
      }
      if (movement != null) movements.add(movement);
    }
    final count = switch (structure) {
      WodStructure.emom
          when intervalSeconds != null &&
              durationSeconds != null &&
              durationSeconds % intervalSeconds == 0 =>
        durationSeconds ~/ intervalSeconds,
      WodStructure.intervals => rounds,
      _ => null,
    };
    return WodPrescription(
      title: title,
      structure: structure,
      scoreKind: switch (structure) {
        WodStructure.forTime => WodScoreKind.time,
        WodStructure.amrap => WodScoreKind.roundsAndReps,
        WodStructure.emom => WodScoreKind.intervals,
        _ => WodScoreKind.unknown,
      },
      rounds: structure == WodStructure.forTime ? rounds : null,
      intervalSeconds: intervalSeconds,
      intervalCount: count,
      timeCapSeconds: timeCapSeconds,
      durationSeconds: durationSeconds,
      movements: List.unmodifiable(movements),
      standards: List.unmodifiable(standards),
      rawText: rawText,
      unparsedLines: List.unmodifiable(unparsed),
      parserVersion: '1',
    );
  }

  static final _pasteCap = RegExp(
    r'\b(?:time\s*cap|cap)\s*[:(]?\s*(\d+)(?::([0-5]\d)|\s*(?:minutes?|min|분)\b)?\s*\)?$',
    caseSensitive: false,
  );
  static final _intervalHeader = RegExp(
    r'^intervals?\s*:\s*(\d+)\s*[x×]\s*(\d+)\s*(?:minutes?|min)\s*:?$',
    caseSensitive: false,
  );
  static final _pasteHeader = RegExp(
    r'^(?:(\d+)\s*(?:minutes?|min|분)\s+|(\d+)\s*(?:rounds?\s+(?=for time)|(?=rft)|(?=intervals?)))?'
    r'(for time|rft|rounds for time|amrap|emom|e(\d+)mom|intervals?)'
    r'(?:\s*[:–-]?\s*(\d+)\s*(?:minutes?|min|분|rounds?)?)?\s*:?$',
    caseSensitive: false,
  );
  static final _standaloneScheme = RegExp(r'^\d+(?:\s*[-–]\s*\d+)+$');
  static final _reviewLine = RegExp(
    r'^\s*(?:part\b|rest\b|then\b|set\s+[a-z0-9]+\s*:|score\b|tiebreak\b)|\s+or\s+',
    caseSensitive: false,
  );
  static final _minuteSlot = RegExp(
    r'^minute\s+(\d+)\s*:\s*',
    caseSensitive: false,
  );
  static final _metricMovement = RegExp(
    r'^(\d+(?:\.\d+)?)\s*-?\s*(m(?:eters?|etres?)?|km|cal(?:orie)?s?|seconds?|sec|minutes?|min)\s+(.+)$',
    caseSensitive: false,
  );
  static final _multipleStandards = RegExp(
    r'\d\s*/\s*\d|\b(?:women|men|female|male|target|height|scaled|rx|sets?)\b|["″]|\b(?:inches|feet|inch|ft)\b',
    caseSensitive: false,
  );

  static int? _positiveInt(String? text) {
    final value = int.tryParse(text ?? '');
    return value == null || value <= 0 ? null : value;
  }

  WodMovementPrescription? _pasteMovement(
    String text,
    List<num> scheme,
    int? interval,
    String rawLine,
  ) {
    final metrics = _metricMovement.firstMatch(text);
    final movement = metrics == null ? _parseMovement(text) : null;
    if (metrics == null && movement == null && scheme.isEmpty) return null;
    final options =
        _multipleStandards.hasMatch(text) ||
        _weightPattern.allMatches(text).length > 1;
    final label = metrics?[3] ?? movement?.name ?? text;
    final singleLoad = options ? null : _weightPattern.firstMatch(label);
    final name =
        (singleLoad == null
                ? label
                : label.replaceRange(singleLoad.start, singleLoad.end, ''))
            .replaceAll(RegExp(r'[()]'), '')
            .trim();
    final metric = metrics?[2]?.toLowerCase();
    final unit = switch (metric) {
      null => WodQuantityUnit.reps,
      'km' || 'm' => WodQuantityUnit.meters,
      _ when metric.startsWith('met') => WodQuantityUnit.meters,
      _ when metric.startsWith('cal') => WodQuantityUnit.calories,
      _ => WodQuantityUnit.seconds,
    };
    final multiplier = metric == 'km'
        ? 1000
        : (metric?.startsWith('min') ?? false)
        ? 60
        : 1;
    final quantities = metrics == null
        ? movement?.repScheme ?? scheme
        : [double.parse(metrics[1]!) * multiplier];
    final resolved = CrossFitCatalog.resolveMovement(name);
    final singular = resolved.entry == null && name.endsWith('s')
        ? CrossFitCatalog.resolveMovement(name.substring(0, name.length - 1))
              .entry
        : null;
    final entry = resolved.entry ?? singular;
    final weight = options
        ? null
        : movement?.weight ??
              double.tryParse((singleLoad?[1] ?? '').replaceAll(',', '.'));
    final weightUnit = movement?.weightUnit ?? singleLoad?[2]?.toLowerCase();
    return WodMovementPrescription(
      name: entry?.name ?? name,
      movementId: entry?.id,
      quantities: List.unmodifiable(quantities),
      unit: unit,
      interval: interval,
      weightKg: weight == null
          ? null
          : (weightUnit?.startsWith('lb') == true ||
                weightUnit?.startsWith('pound') == true)
          ? weight * 0.45359237
          : weight,
      options: options ? [rawLine] : const [],
    );
  }

  WodDraft parse(String rawText) {
    final lines = rawText
        .replaceAll('\r\n', '\n')
        .replaceAll('\r', '\n')
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .toList(growable: false);

    final commonLines = <String>[];
    final sections = <({String label, List<String> lines})>[];
    final letterLabels = lines
        .map(_letterLevel.firstMatch)
        .whereType<RegExpMatch>()
        .map((match) => match.group(1)!.replaceFirst('[', '').substring(0, 1))
        .toSet();
    for (final line in lines) {
      final heading =
          _levelHeading.firstMatch(line) ??
          (letterLabels.length > 1 ? _letterLevel.firstMatch(line) : null);
      if (heading != null) {
        final label = heading.group(1)!.replaceAll(RegExp(r'[\[\]]'), '');
        final inline = heading.group(2)?.trim();
        sections.add((
          label: label,
          lines: [if (inline != null && inline.isNotEmpty) inline],
        ));
      } else {
        (sections.isEmpty ? commonLines : sections.last.lines).add(line);
      }
    }
    final common = _parsePrescription(rawText, commonLines);
    if (sections.isEmpty) return common;

    final levels = <WodLevelDraft>[];
    for (final section in sections) {
      final prescription = _parsePrescription(
        section.lines.join('\n'),
        section.lines,
      );
      final inheritsHeader = prescription.format == WodFormat.unknown;
      levels.add(
        WodLevelDraft(
          label: section.label,
          prescription: WodDraft(
            rawText: prescription.rawText,
            format: inheritsHeader ? common.format : prescription.format,
            durationMinutes: inheritsHeader
                ? common.durationMinutes
                : prescription.durationMinutes,
            timeCapMinutes:
                prescription.timeCapMinutes ??
                (inheritsHeader ? common.timeCapMinutes : null),
            rounds: inheritsHeader ? common.rounds : prescription.rounds,
            movements: prescription.movements,
            unknownLines: prescription.unknownLines,
            confidence: prescription.confidence,
          ),
        ),
      );
    }
    return WodDraft(
      rawText: rawText,
      format: common.format,
      durationMinutes: common.durationMinutes,
      timeCapMinutes: common.timeCapMinutes,
      rounds: common.rounds,
      movements: common.movements,
      unknownLines: common.unknownLines,
      confidence: common.confidence,
      levels: List.unmodifiable(levels),
    );
  }

  WodDraft _parsePrescription(String rawText, List<String> lines) {
    var format = WodFormat.unknown;
    int? durationMinutes;
    int? timeCapMinutes;
    int? rounds;
    final movements = <WodMovementDraft>[];
    final unknownLines = <String>[];
    var recognizedHeader = false;

    for (final line in lines) {
      final amrap = _amrapPattern.firstMatch(line);
      if (amrap != null) {
        if (format != WodFormat.unknown && format != WodFormat.amrap) {
          unknownLines.add(line);
          continue;
        }
        format = WodFormat.amrap;
        final before = int.tryParse(amrap.group(1) ?? '');
        final after = int.tryParse(amrap.group(2) ?? '');
        durationMinutes = before ?? after ?? durationMinutes;
        recognizedHeader = true;
        continue;
      }

      final emom = _emomPattern.firstMatch(line);
      if (emom != null) {
        if (format != WodFormat.unknown && format != WodFormat.emom) {
          unknownLines.add(line);
          continue;
        }
        format = WodFormat.emom;
        durationMinutes = int.tryParse(emom.group(1) ?? emom.group(2) ?? '');
        recognizedHeader = true;
        continue;
      }

      final roundMatch = _roundsPattern.firstMatch(line);
      if (roundMatch != null || _forTimePattern.hasMatch(line)) {
        if (format != WodFormat.unknown && format != WodFormat.forTime) {
          unknownLines.add(line);
          continue;
        }
        format = WodFormat.forTime;
        rounds =
            int.tryParse(roundMatch?.group(1) ?? roundMatch?.group(2) ?? '') ??
            rounds;
        final cap = _timeCapPattern.firstMatch(line);
        timeCapMinutes = int.tryParse(cap?.group(1) ?? '') ?? timeCapMinutes;
        recognizedHeader = true;
        continue;
      }

      final cap = _timeCapPattern.matchAsPrefix(line);
      if (cap != null) {
        timeCapMinutes = int.tryParse(cap.group(1)!);
        recognizedHeader = true;
        continue;
      }

      final duration = _durationPattern.firstMatch(line);
      if (duration != null &&
          (format == WodFormat.amrap || format == WodFormat.emom)) {
        durationMinutes ??= int.tryParse(duration.group(1) ?? '');
        recognizedHeader = true;
        continue;
      }

      final parsedMovement = _parseMovement(line);
      if (parsedMovement == null) {
        unknownLines.add(line);
      } else {
        movements.add(parsedMovement);
      }
    }

    return WodDraft(
      rawText: rawText,
      format: format,
      durationMinutes: durationMinutes,
      timeCapMinutes: timeCapMinutes,
      rounds: rounds,
      movements: List.unmodifiable(movements),
      unknownLines: List.unmodifiable(unknownLines),
      confidence: _overallConfidence(
        lines.length,
        recognizedHeader,
        movements,
        unknownLines,
      ),
    );
  }

  WodMovementDraft? _parseMovement(String line) {
    // A ratio such as `20/14` can describe different loads for different
    // athletes. Keep it for review instead of guessing which number applies.
    if (_ambiguousLoadPattern.hasMatch(line)) return null;

    final measured = _measuredMovement.firstMatch(line);
    if (measured != null) {
      final unit = measured.group(2)!.toLowerCase();
      return WodMovementDraft(
        name: measured.group(3)!.trim(),
        rawLine: line,
        quantity: double.tryParse(measured.group(1)!.replaceAll(',', '.')),
        quantityUnit: switch (unit) {
          'km' => 'km',
          'mi' || 'mile' || 'miles' => 'mi',
          _ when unit.startsWith('cal') => 'cal',
          _ => 'm',
        },
        confidence: 0.9,
      );
    }

    List<int>? repScheme;
    String remainder;
    var confidence = 0.82;

    final schemeMatch = _repSchemes.firstMatch(line);
    if (schemeMatch != null) {
      repScheme = schemeMatch
          .group(1)!
          .split(RegExp(r'\s*[-–]\s*'))
          .map(int.parse)
          .toList(growable: false);
      remainder = schemeMatch.group(2)!.trim();
      confidence = 0.88;
    } else {
      final explicitMatch = _explicitReps.firstMatch(line);
      final repsMatch = explicitMatch ?? _repsWord.firstMatch(line);
      if (repsMatch == null) return null;
      repScheme = [int.parse(repsMatch.group(1)!)];
      remainder = repsMatch.group(2)!.trim();
      if (explicitMatch != null) confidence = 0.88;
    }

    final weightMatch = _weightPattern.firstMatch(remainder);
    double? weight;
    String? weightUnit;
    if (weightMatch != null) {
      weight = double.tryParse(weightMatch.group(1)!.replaceAll(',', '.'));
      final unit = weightMatch.group(2)!.toLowerCase();
      weightUnit = unit.startsWith('kg') || unit.startsWith('kilo')
          ? 'kg'
          : 'lb';
      remainder = remainder.replaceRange(
        weightMatch.start,
        weightMatch.end,
        '',
      );
      confidence = 0.94;
    }

    final name = remainder
        .replaceAll(RegExp(r'[(),:]'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
    if (name.isEmpty) return null;

    return WodMovementDraft(
      name: name,
      rawLine: line,
      repScheme: List.unmodifiable(repScheme),
      weight: weight,
      weightUnit: weightUnit,
      confidence: confidence,
    );
  }

  double _overallConfidence(
    int lineCount,
    bool recognizedHeader,
    List<WodMovementDraft> movements,
    List<String> unknownLines,
  ) {
    if (lineCount == 0) return 0;
    final scores = <double>[];
    if (recognizedHeader) scores.add(0.9);
    scores.addAll(movements.map((movement) => movement.confidence));
    scores.addAll(List<double>.filled(unknownLines.length, 0.25));
    if (scores.isEmpty) return 0.2;
    final average = scores.reduce((a, b) => a + b) / scores.length;
    return average.clamp(0, 1).toDouble();
  }
}
