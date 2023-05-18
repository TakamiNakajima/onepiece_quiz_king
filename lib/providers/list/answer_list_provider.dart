import 'package:flutter_riverpod/flutter_riverpod.dart';

final answersListProvider = StateNotifierProvider<TodosNotifier, List<String>>((ref) {
  return TodosNotifier();
});

class TodosNotifier extends StateNotifier<List<String>> {
  TodosNotifier(): super([]);

  //追加
  void addAnswer(String answer) {
    state = [...state, answer];
  }

  //クリア
  void clearList() {
    state = [];
  }

  //シャッフル
  void shuffleList() {
    state.shuffle();
  }
}