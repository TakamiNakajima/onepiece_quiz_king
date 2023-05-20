import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onepiece_quiz_king/db/database.dart';

final testDataListProvider = StateNotifierProvider<TestDatasNotifier, List<Word>>((ref) {
  return TestDatasNotifier();
});

class TestDatasNotifier extends StateNotifier<List<Word>> {
  TestDatasNotifier(): super([]);

  //追加
  void addAnswer(Word word) {
    state = [...state, word];
  }
}