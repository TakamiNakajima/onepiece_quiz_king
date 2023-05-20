import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onepiece_quiz_king/const/const.dart';
import 'package:onepiece_quiz_king/enum/enum.dart';
import 'package:onepiece_quiz_king/provider/bool/a_card_visible_provider.dart';
import 'package:onepiece_quiz_king/provider/bool/is_able_to_press_provider.dart';
import 'package:onepiece_quiz_king/provider/bool/is_fab_visible_provider.dart';
import 'package:onepiece_quiz_king/provider/bool/q_card_visible_provider.dart';
import 'package:onepiece_quiz_king/provider/bool/selected_a_correct_provider.dart';
import 'package:onepiece_quiz_king/provider/current_series.dart';
import 'package:onepiece_quiz_king/provider/int/ad_count_provider.dart';
import 'package:onepiece_quiz_king/provider/int/number_of_question_provider.dart';
import 'package:onepiece_quiz_king/provider/int/q_index_provider.dart';
import 'package:onepiece_quiz_king/provider/list/answer_list_provider.dart';
import 'package:onepiece_quiz_king/provider/list/test_data_list_provider.dart';
import 'package:onepiece_quiz_king/provider/string/question_txt_provider.dart';
import 'package:onepiece_quiz_king/provider/test_status_provider.dart';
import 'package:onepiece_quiz_king/view/components/ad_part.dart';
import 'package:onepiece_quiz_king/view/components/buttons/go_next_button.dart';
import 'package:onepiece_quiz_king/view/components/end_message.dart';
import 'package:onepiece_quiz_king/view/components/judge_Image_and_answer.dart';
import 'package:onepiece_quiz_king/view/components/list_item.dart';
import 'package:onepiece_quiz_king/view/components/number_of_question_part.dart';
import 'package:onepiece_quiz_king/view/components/question_card_part.dart';
import 'package:onepiece_quiz_king/view/components/texts/testscreen_title_text.dart';
import 'package:onepiece_quiz_king/view_model/ad_view_model.dart';
import 'package:onepiece_quiz_king/view_model/main_view_model.dart';
import 'package:just_audio/just_audio.dart';

class TestScreen extends ConsumerStatefulWidget {

  @override
  TestScreenState createState() => TestScreenState();
}

class TestScreenState extends ConsumerState<TestScreen> {
  MainViewModel _mainViewModel = MainViewModel();
  AdViewModel _adViewModel = AdViewModel();

  @override
  void initState() {
    super.initState();
    _adViewModel.initBannerAd();
    _adViewModel.initInterstitialAd(ref);
    _adViewModel.loadBannerAd();
    _mainViewModel.readAllProviders(ref);
    _mainViewModel.audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    _adViewModel.bannerAd?.dispose();
    _adViewModel.interstitialAd?.dispose();
    _mainViewModel.audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isQCardVisible = ref.watch(qCardVisibleProvider);
    final judgeImageVisible = ref.watch(judgeImageProvider);
    final selectedACorrect = ref.watch(selectedACorrectProvider);
    final answersList = ref.watch(answersListProvider);
    final series = ref.watch(currentSeriesProvider);
    return CupertinoPageScaffold(
      backgroundColor: subColor,
      navigationBar: CupertinoNavigationBar(
        middle: TestScreenTitleText(series: series),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios_new_rounded, color: whiteColor),
        ),
        backgroundColor: mainColor,
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              NumberOfQuestionPart(),
              SizedBox(height: 20),
              QuestionCardPart(),
              SizedBox(height: 50),
              isQCardVisible
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: answersList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final currentAnswer = _mainViewModel.currentWord.strAnswer;
                        return ListItem(
                          index: index,
                          onTap: () => _checkAnswer(answersList[index], currentAnswer),
                        );
                      },
                    )
                  : Container(),
              SizedBox(height: 40),
            ],
          ),
          //次へボタン
          GoNextButton(() => _goNextStatus()),
          //終了メッセージ
          EndMessage(),
          AdPart(bannerAd: _adViewModel.bannerAd),
          //正解のとき
          judgeImageVisible && selectedACorrect
              ? CorrectedImageAndAnswer(
                  isCorrected: true, currentWord: _mainViewModel.currentWord)
              : Container(),
          //不正解のとき
          judgeImageVisible && !selectedACorrect
              ? CorrectedImageAndAnswer(
                  isCorrected: false, currentWord: _mainViewModel.currentWord)
              : Container(),
        ],
      ),
    );
  }

  _checkAnswer(String selectedAnswer, String correctAnswer) async {
    ref.read(testStatusProvider.notifier).state = TestStatus.SHOW_ANSWER;
    ref.read(qCardVisibleProvider.notifier).state = true;
    ref.read(judgeImageProvider.notifier).state = true;
    ref.read(isFabVisibleProvider.notifier).state = false;
    ref.read(isAbleToPressProvider.notifier).state = false;
    //正解したとき
    if (selectedAnswer == correctAnswer) {
      ref.read(selectedACorrectProvider.notifier).state = true;
      ref.read(judgeImageProvider.notifier).state = true;
      await _mainViewModel.audioPlayer.setAsset("assets/sounds/sound_correct.mp3");
      _mainViewModel.audioPlayer.play();
      await Future.delayed(Duration(seconds: 2));
      ref.read(adCountProvider.notifier).state--;
      if (ref.watch(adCountProvider) <= 0) {
        _adViewModel.loadInterstitialAd(ref);
        ref.read(adCountProvider.notifier).state = 5;
      }
      if (ref.watch(numberOfQuestionProvider) <= 0) {
        ref.read(isFabVisibleProvider.notifier).state = false;
        ref.read(testStatusProvider.notifier).state = TestStatus.FINISHED;
        ref.read(answersListProvider.notifier).clearList();
      } else {
        ref.read(testStatusProvider.notifier).state = TestStatus.SHOW_QUESTION;
        ref.read(answersListProvider.notifier).clearList();
        _showQuestion();
      }
    } else {
      //不正解のとき
      ref.read(selectedACorrectProvider.notifier).state = false;
      ref.read(judgeImageProvider.notifier).state = true;
      await _mainViewModel.audioPlayer.setAsset("assets/sounds/sound_incorrect.mp3");
      _mainViewModel.audioPlayer.play();
      await Future.delayed(Duration(seconds: 2));
      ref.read(adCountProvider.notifier).state--;
      if (ref.watch(adCountProvider) <= 0) {
        _adViewModel.loadInterstitialAd(ref);
        ref.read(adCountProvider.notifier).state = 5;
      }
      if (ref.watch(numberOfQuestionProvider) <= 0) {
        ref.read(isFabVisibleProvider.notifier).state = false;
        ref.read(answersListProvider.notifier).clearList();
        ref.read(testStatusProvider.notifier).state = TestStatus.FINISHED;
      } else {
        ref.read(testStatusProvider.notifier).state = TestStatus.SHOW_QUESTION;
        ref.read(answersListProvider.notifier).clearList();
        _showQuestion();
      }
    }
  }

  _goNextStatus() async {
    switch (ref.watch(testStatusProvider)) {
      case TestStatus.BEFORE_START:
        ref.read(testStatusProvider.notifier).state = TestStatus.SHOW_QUESTION;
        _showQuestion();
        break;
      case TestStatus.SHOW_QUESTION:
        break;
      case TestStatus.SHOW_ANSWER:
        if (ref.watch(numberOfQuestionProvider) <= 0) {
          ref.read(selectedACorrectProvider.notifier).state = false;
          ref.read(isFabVisibleProvider.notifier).state = false;
          ref.read(testStatusProvider.notifier).state = TestStatus.FINISHED;
          ref.read(answersListProvider.notifier).clearList();
        } else {
          ref.read(testStatusProvider.notifier).state = TestStatus.SHOW_QUESTION;
          ref.read(answersListProvider.notifier).clearList();
          _showQuestion();
        }
        break;
      case TestStatus.FINISHED:
        break;
    }
  }

  _showQuestion() async {
    _mainViewModel.currentWord = ref.watch(testDataListProvider)[ref.watch(questionIndexProvider)];
    await _refreshSelectableList();
    ref.read(qCardVisibleProvider.notifier).state = true;
    ref.read(judgeImageProvider.notifier).state = false;
    ref.read(isFabVisibleProvider.notifier).state = false;
    ref.read(isAbleToPressProvider.notifier).state = true;
    ref.read(qTxtProvider.notifier).state = _mainViewModel.currentWord.strQuestion;
    ref.read(numberOfQuestionProvider.notifier).state -= 1;
    ref.read(questionIndexProvider.notifier).state += 1;
  }

  _refreshSelectableList() async {
    ref.read(answersListProvider.notifier).clearList();
    ref.read(answersListProvider.notifier).addAnswer(_mainViewModel.currentWord.strAnswer);
    ref.read(answersListProvider.notifier).addAnswer(_mainViewModel.currentWord.fakeFirst);
    ref.read(answersListProvider.notifier).addAnswer(_mainViewModel.currentWord.fakeSecond);
    ref.read(answersListProvider.notifier).shuffleList();
  }
}
