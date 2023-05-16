import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onepiece_quiz_king/const/const.dart';
import 'package:onepiece_quiz_king/enum/enum.dart';
import 'package:onepiece_quiz_king/providers/bool/a_card_visible_provider.dart';
import 'package:onepiece_quiz_king/providers/bool/is_able_to_press_provider.dart';
import 'package:onepiece_quiz_king/providers/bool/is_fab_visible_provider.dart';
import 'package:onepiece_quiz_king/providers/bool/q_card_visible_provider.dart';
import 'package:onepiece_quiz_king/providers/bool/selected_a_correct_provider.dart';
import 'package:onepiece_quiz_king/providers/int/ad_count_provider.dart';
import 'package:onepiece_quiz_king/providers/int/number_of_question_provider.dart';
import 'package:onepiece_quiz_king/providers/int/q_index_provider.dart';
import 'package:onepiece_quiz_king/providers/list/answer_list_provider.dart';
import 'package:onepiece_quiz_king/providers/list/test_data_list_provider.dart';
import 'package:onepiece_quiz_king/providers/string/question_txt_provider.dart';
import 'package:onepiece_quiz_king/providers/test_status/test_status_provider.dart';
import 'package:onepiece_quiz_king/view_model/ad_view_model.dart';
import 'package:onepiece_quiz_king/view_model/main_view_model.dart';
import 'package:onepiece_quiz_king/views/components/buttons/go_next_button.dart';
import 'package:onepiece_quiz_king/views/components/end_message.dart';
import 'package:onepiece_quiz_king/views/components/number_of_question_part.dart';
import 'package:onepiece_quiz_king/views/components/question_card_part.dart';
import 'package:onepiece_quiz_king/views/components/texts/testscreen_title_text.dart';
import 'package:just_audio/just_audio.dart';
import 'package:onepiece_quiz_king/views/components/corrected_Image_and_answer.dart';

class TestScreen extends ConsumerStatefulWidget {
  SERIES series;
  TestScreen({required this.series});

  @override
  TestScreenState createState() => TestScreenState();
}

class TestScreenState extends ConsumerState<TestScreen> {
  MainViewModel _mainViewModel = MainViewModel();
  AdViewModel _adViewModel = AdViewModel();

  @override
  void initState() {
    super.initState();
    _mainViewModel.getTestData(ref, widget.series);
    // _initBannerAd();
    _adViewModel.initInterstitialAd(ref);
    // _adViewModel.loadBannerAd();
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
    final maruOrBatuVisible = ref.watch(maruOrBatuProvider);
    final isFabVisible = ref.watch(isFabVisibleProvider);
    final selectedACorrect = ref.watch(selectedACorrectProvider);
    final ableToPress = ref.watch(isAbleToPressProvider);
    final questionText = ref.watch(qTxtProvider);
    final numberOfQ = ref.watch(numberOfQuestionProvider);
    final testStatusP = ref.watch(testStatusProvider);
    final answersListP = ref.watch(answersListProvider);
    final testDataListP = ref.watch(testDataListProvider);
    return CupertinoPageScaffold(
      backgroundColor: subColor,
      navigationBar: CupertinoNavigationBar(
        middle: TestScreenTitleText(series: widget.series),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
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
              //のこり問題数表示部分
              NumberOfQuestionPart(numberOfQuestion: numberOfQ),
              SizedBox(height: 20),
              // 問題カード表示部分
              QuestionCardPart(
                isQuestionCardVisible: isQCardVisible,
                txtQuestion: questionText,
                level: _mainViewModel.currentWord.level,
              ),
              //選択肢カード表示部分
              isQCardVisible
                  ? Padding(
                padding:
                const EdgeInsets.only(top: 50.0, left: 20, right: 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: answersListP.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = answersListP[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Material(
                        color: subColor,
                        child: InkWell(
                          onTap: () => ableToPress
                              ? _checkAnswer(item, _mainViewModel.currentWord.strAnswer)
                              : null,
                          child: Card(
                            elevation: 4,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: redColor, width: 1.5),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        item,
                                        style: lanobeAnswerTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
                  : Container(),
              SizedBox(height: 40),
            ],
          ),
          //次へボタン
          GoNextButton(
            isFabVisible: isFabVisible,
            testDataList: testDataListP,
            onPressed: () => _goNextStatus(),
          ),
          //終了メッセージ
          EndMessage(testStatus: testStatusP),
          // AdPart(bannerAd: _adViewModel.bannerAd),
          //正解のとき
          maruOrBatuVisible && selectedACorrect
              ? CorrectedImageAndAnswer(
                  isCorrected: true, currentWord: _mainViewModel.currentWord)
              : Container(),
          //不正解のとき
          maruOrBatuVisible && !selectedACorrect
              ? CorrectedImageAndAnswer(
                  isCorrected: false, currentWord: _mainViewModel.currentWord)
              : Container(),
        ],
      ),
    );
  }

  void _checkAnswer(String selectedAnswer, String correctAnswer) async {
    ref.read(testStatusProvider.notifier).state = TestStatus.SHOW_ANSWER;
    ref.read(qCardVisibleProvider.notifier).state = true;
    ref.read(maruOrBatuProvider.notifier).state = true;
    ref.read(isFabVisibleProvider.notifier).state = false;
    ref.read(isAbleToPressProvider.notifier).state = false;
    if (selectedAnswer == correctAnswer) {
      ref.read(selectedACorrectProvider.notifier).state = true;
      ref.read(maruOrBatuProvider.notifier).state = true;
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
        ref.read(answersListProvider.notifier).state = [];
      } else {
        ref.read(testStatusProvider.notifier).state = TestStatus.SHOW_QUESTION;
        ref.read(answersListProvider.notifier).state = [];
        _showQuestion();
      }
    } else {
      ref.read(selectedACorrectProvider.notifier).state = false;
      ref.read(maruOrBatuProvider.notifier).state = true;
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
        ref.read(answersListProvider.notifier).state = [];
        ref.read(testStatusProvider.notifier).state = TestStatus.FINISHED;
      } else {
        ref.read(testStatusProvider.notifier).state = TestStatus.SHOW_QUESTION;
        ref.read(answersListProvider.notifier).state = [];
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
          ref.read(answersListProvider.notifier).state = [];
        } else {
          ref.read(testStatusProvider.notifier).state =
              TestStatus.SHOW_QUESTION;
          ref.read(answersListProvider.notifier).state = [];
          _showQuestion();
        }
        break;
      case TestStatus.FINISHED:
        break;
    }
  }

  void _showQuestion() async {
    _mainViewModel.currentWord = ref.watch(testDataListProvider)[ref.watch(questionIndexProvider)];
    await refreshAnswerList();
    ref.read(qCardVisibleProvider.notifier).state = true;
    ref.read(maruOrBatuProvider.notifier).state = false;
    ref.read(isFabVisibleProvider.notifier).state = false;
    ref.read(isAbleToPressProvider.notifier).state = true;
    ref.read(qTxtProvider.notifier).state = _mainViewModel.currentWord.strQuestion;
    ref.read(numberOfQuestionProvider.notifier).state -= 1;
    ref.read(questionIndexProvider.notifier).state += 1;
  }

  refreshAnswerList() async {
    ref.read(answersListProvider.notifier).state = [];
    ref.read(answersListProvider.notifier).addAnswer(_mainViewModel.currentWord.strAnswer);
    ref.read(answersListProvider.notifier).addAnswer(_mainViewModel.currentWord.fakeFirst);
    ref.read(answersListProvider.notifier).addAnswer(_mainViewModel.currentWord.fakeSecond);
    ref.read(answersListProvider.notifier).state.shuffle();
  }
}
