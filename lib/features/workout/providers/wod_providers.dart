import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database_provider.dart';
import '../data/wod_repository.dart';

final wodRepositoryProvider = Provider<WodRepository>((ref) {
  return WodRepository(ref.watch(appDatabaseProvider));
});

final wodBlocksForSessionProvider = StreamProvider.family((ref, String sessionId) {
  return ref.watch(wodRepositoryProvider).watchWodBlocks(sessionId);
});

final wodResultProvider = StreamProvider.family((ref, String blockId) {
  return ref.watch(wodRepositoryProvider).watchResult(blockId);
});
