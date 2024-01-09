import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onepiece_quiz_king/dao/database.dart';
import 'package:onepiece_quiz_king/utils/enum.dart';

// 判定画像表示用フラグ
final judgeImageProvider = StateProvider<bool>((ref) => false);

// 広告表示用カウント
final adCountProvider = StateProvider<int>((ref) => 5);

// 選択しているシリーズ
final currentSeriesProvider = StateProvider<SERIES>((ref) => SERIES.ALL);

// インタースティシャル広告用
final interstitialNumProvider = StateProvider<int>((ref) => 0);

// ボタン押下可否フラグ
final isAbleToPressProvider = StateProvider<bool>((ref) => false);

// フローティングアクションボタン表示フラグ
final isFabVisibleProvider = StateProvider<bool>((ref) => true);

// 問題数
final numberOfQuestionProvider = StateProvider<int>((ref) => 0);

// 問題カード表示フラグ
final qCardVisibleProvider = StateProvider<bool>((ref) => false);

// 今何問目か
final questionIndexProvider = StateProvider<int>((ref) => 0);

// 問題文
final qTxtProvider = StateProvider<String>((ref) => "");

// 成否判定フラグ
final selectedACorrectProvider = StateProvider<bool>((ref) => false);

// 現在のテストステータス
final testStatusProvider = StateProvider<TestStatus>((ref) => TestStatus.BEFORE_START);

final answersListProvider = StateNotifierProvider<TodosNotifier, List<String>>((ref) {
  return TodosNotifier();
});

//
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

// クイズのリスト
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

