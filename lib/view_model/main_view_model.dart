import 'package:just_audio/just_audio.dart';
import 'package:onepiece_quiz_king/db/database.dart';
import 'package:onepiece_quiz_king/enum/enum.dart';
import 'package:onepiece_quiz_king/main.dart';
import 'package:onepiece_quiz_king/provider/bool/a_card_visible_provider.dart';
import 'package:onepiece_quiz_king/provider/bool/is_able_to_press_provider.dart';
import 'package:onepiece_quiz_king/provider/bool/is_fab_visible_provider.dart';
import 'package:onepiece_quiz_king/provider/bool/q_card_visible_provider.dart';
import 'package:onepiece_quiz_king/provider/bool/selected_a_correct_provider.dart';
import 'package:onepiece_quiz_king/provider/current_series.dart';
import 'package:onepiece_quiz_king/provider/int/ad_count_provider.dart';
import 'package:onepiece_quiz_king/provider/int/interstitial_load_attempt_provider.dart';
import 'package:onepiece_quiz_king/provider/int/number_of_question_provider.dart';
import 'package:onepiece_quiz_king/provider/int/q_index_provider.dart';
import 'package:onepiece_quiz_king/provider/list/answer_list_provider.dart';
import 'package:onepiece_quiz_king/provider/list/test_data_list_provider.dart';
import 'package:onepiece_quiz_king/provider/string/question_txt_provider.dart';
import 'package:onepiece_quiz_king/provider/test_status_provider.dart';

class MainViewModel {
  late AudioPlayer audioPlayer;
  late Word currentWord = Word(
    strQuestion: "",
    strAnswer: "",
    isMemorized: false,
    series: 1,
    level: 1,
    fakeFirst: '',
    fakeSecond: '',
  );

  void getTestData(ref, series) async {
    switch (series) {
      case SERIES.ALL:
        ref.read(testDataListProvider.notifier).state = await database.allWords;
        break;
      case SERIES.EASTBLUE:
        ref.read(testDataListProvider.notifier).state =
        await database.seriesOfEastBlue;
        break;
      case SERIES.ALABASTA:
        ref.read(testDataListProvider.notifier).state =
        await database.seriesOfAlaBasta;
        break;
      case SERIES.SKYISLAND:
        ref.read(testDataListProvider.notifier).state =
        await database.seriesOfSkyIsland;
        break;
      case SERIES.WATERSEVEN:
        ref.read(testDataListProvider.notifier).state =
        await database.seriesOfWaterSeven;
        break;
      case SERIES.THRILLERBARK:
        ref.read(testDataListProvider.notifier).state =
        await database.seriesOfThrillerBark;
        break;
      case SERIES.IMPELDOWN:
        ref.read(testDataListProvider.notifier).state =
        await database.seriesOfImpelDown;
        break;
      case SERIES.FISHMANISLAND:
        ref.read(testDataListProvider.notifier).state =
        await database.seriesOfFishmanIsland;
        break;
      case SERIES.DRESSROSA:
        ref.read(testDataListProvider.notifier).state =
        await database.seriesOfDressRosa;
        break;
      case SERIES.WHOLECAKEISLAND:
        ref.read(testDataListProvider.notifier).state =
        await database.seriesOfWholeCakeIsland;
        break;
      case SERIES.WANOKUNI:
        ref.read(testDataListProvider.notifier).state =
        await database.seriesOfWaNoKuni;
        break;
    }
    ref.read(testDataListProvider.notifier).state.shuffle();
    ref.read(testStatusProvider.notifier).state = TestStatus.BEFORE_START;
    ref.read(questionIndexProvider.notifier).state = 0;
    ref.read(qCardVisibleProvider.notifier).state = false;
    ref.read(judgeImageProvider.notifier).state = false;
    ref.read(isFabVisibleProvider.notifier).state = true;
    ref.read(numberOfQuestionProvider.notifier).state =
        ref.watch(testDataListProvider).length;
  }

  void readAllProviders(ref) {
    ref.read(qCardVisibleProvider);
    ref.read(judgeImageProvider);
    ref.read(isFabVisibleProvider);
    ref.read(selectedACorrectProvider);
    ref.read(isAbleToPressProvider);
    ref.read(qTxtProvider);
    ref.read(numberOfQuestionProvider);
    ref.read(questionIndexProvider);
    ref.read(adCountProvider);
    ref.read(testStatusProvider);
    ref.read(answersListProvider);
    ref.read(testDataListProvider);
    ref.read(interstitialNumProvider);
    ref.read(currentSeriesProvider);
  }

}
