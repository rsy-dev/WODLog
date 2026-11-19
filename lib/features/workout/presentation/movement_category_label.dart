import '../../../l10n/generated/app_localizations.dart';
import '../data/crossfit_catalog.dart';

String movementCategoryLabel(
  AppLocalizations l10n,
  CrossFitCategory category,
) => switch (category) {
  CrossFitCategory.barbell => l10n.categoryBarbell,
  CrossFitCategory.gymnastics => l10n.categoryGymnastics,
  CrossFitCategory.dumbbellKettlebell => l10n.categoryDumbbellKettlebell,
  CrossFitCategory.cardio => l10n.categoryCardio,
  CrossFitCategory.bodyweight => l10n.categoryBodyweight,
  CrossFitCategory.otherEquipment => l10n.categoryOtherEquipment,
  CrossFitCategory.benchmarkWod => l10n.categoryBenchmarkWod,
};
