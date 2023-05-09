import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:onepiece_quiz_king/const/const.dart';
import 'package:onepiece_quiz_king/db/database.dart';
import 'package:onepiece_quiz_king/main.dart';
import 'package:onepiece_quiz_king/models/data/series.dart';
import 'package:onepiece_quiz_king/models/manager/ad_manager.dart';
import 'package:onepiece_quiz_king/providers/bool/a_card_visible_provider.dart';
import 'package:onepiece_quiz_king/providers/bool/is_able_to_press_provider.dart';
import 'package:onepiece_quiz_king/providers/bool/is_fab_visible_provider.dart';
import 'package:onepiece_quiz_king/providers/bool/q_card_visible_provider.dart';
import 'package:onepiece_quiz_king/providers/bool/selected_a_correct_provider.dart';
import 'package:onepiece_quiz_king/providers/int/ad_count_provider.dart';
import 'package:onepiece_quiz_king/providers/int/interstitial_load_attempt_provider.dart';
import 'package:onepiece_quiz_king/providers/int/number_of_question_provider.dart';
import 'package:onepiece_quiz_king/providers/int/q_index_provider.dart';
import 'package:onepiece_quiz_king/providers/list/answer_list_provider.dart';
import 'package:onepiece_quiz_king/providers/list/test_data_list_provider.dart';
import 'package:onepiece_quiz_king/providers/string/question_txt_provider.dart';
import 'package:onepiece_quiz_king/providers/test_status/test_status_provider.dart';
import 'package:onepiece_quiz_king/views/components/buttons/go_next_button.dart';
import 'package:onepiece_quiz_king/views/components/end_message.dart';
import 'package:onepiece_quiz_king/views/components/number_of_question_part.dart';
import 'package:onepiece_quiz_king/views/components/question_card_part.dart';
import 'package:onepiece_quiz_king/views/components/texts/testscreen_title_text.dart';

enum TestStatus { BEFORE_START, SHOW_QUESTION, SHOW_ANSWER, FINISHED }

class Test2Screen extends ConsumerStatefulWidget {
  SERIES series;

  Test2Screen({required this.series});

  @override
  Test2ScreenState createState() => Test2ScreenState();
}

class Test2ScreenState extends ConsumerState<Test2Screen> {
  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;
  late Word currentWord = Word(
    strQuestion: "",
    strAnswer: "",
    isMemorized: false,
    series: 1,
    level: 1,
    fakeFirst: '',
    fakeSecond: '',
  );

  @override
  void initState() {
    super.initState();
    _getTestData();
    // _loadBannerAd();
    // _initBannerAd();
    // _initInterstitialAd();
    _readAllProviders();
  }

  void _readAllProviders() {
    ref.read(qCardVisibleProvider);
    ref.read(aCardVisibleProvider);
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
  }

  @override
  void dispose() {
    super.dispose();
    bannerAd?.dispose();
    interstitialAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isQCardVisible = ref.watch(qCardVisibleProvider);
    final isACardVisible = ref.watch(aCardVisibleProvider);
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
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
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
                  level: currentWord.level,
                ),
                //選択肢カード表示部分
                isQCardVisible
                    ? Padding(
                        padding: const EdgeInsets.only(
                            top: 50.0, left: 20, right: 20),
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
                                      ? _checkAnswer(
                                          item, currentWord.strAnswer)
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
            Positioned(
              right: 30,
              bottom: 70,
              child: GoNextButton(
                isFabVisible: isFabVisible,
                testDataList: testDataListP,
                onPressed: () => _goNextStatus(),
              ),
            ),
            //終了メッセージ
            EndMessage(testStatus: testStatusP),
            adPart(bannerAd),
            //正解のとき
            isACardVisible && selectedACorrect
                ? Center(child: Image.asset("assets/images/pic_correct.png"))
                : Container(),
            //不正解のとき
            isACardVisible && !selectedACorrect
                ? Center(child: Image.asset("assets/images/pic_incorrect.png"))
                : Container(),
          ],
        ),
      ),
    );
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
    currentWord = ref.watch(testDataListProvider)[ref.watch(questionIndexProvider)];
    await _refreshAnswerList();
    ref.read(qCardVisibleProvider.notifier).state = true;
    ref.read(aCardVisibleProvider.notifier).state = false;
    ref.read(isFabVisibleProvider.notifier).state = false;
    ref.read(isAbleToPressProvider.notifier).state = true;
    ref.read(qTxtProvider.notifier).state = currentWord.strQuestion;
    ref.read(numberOfQuestionProvider.notifier).state -= 1;
    ref.read(questionIndexProvider.notifier).state += 1;
  }

  void _getTestData() async {
    switch (widget.series) {
      case SERIES.ALL:
        ref.read(testDataListProvider.notifier).state = await database.allWords;
        break;
      case SERIES.LEVEL1:
        ref.read(testDataListProvider.notifier).state =
            await database.allWordsOflevel1;
        break;
      case SERIES.LEVEL2:
        ref.read(testDataListProvider.notifier).state =
            await database.allWordsOflevel2;
        break;
      case SERIES.LEVEL3:
        ref.read(testDataListProvider.notifier).state =
            await database.allWordsOflevel3;
        break;
      case SERIES.LEVEL4:
        ref.read(testDataListProvider.notifier).state =
            await database.allWordsOflevel4;
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
    ref.read(aCardVisibleProvider.notifier).state = false;
    ref.read(isFabVisibleProvider.notifier).state = true;
    ref.read(numberOfQuestionProvider.notifier).state =
        ref.watch(testDataListProvider).length;
  }

  _refreshAnswerList() async {
    ref.read(answersListProvider.notifier).state = [];
    ref.read(answersListProvider.notifier).addAnswer(currentWord.strAnswer);
    ref.read(answersListProvider.notifier).addAnswer(currentWord.fakeFirst);
    ref.read(answersListProvider.notifier).addAnswer(currentWord.fakeSecond);
    ref.read(answersListProvider.notifier).state.shuffle();
  }

  void _checkAnswer(String selectedAnswer, String correctAnswer) async {
    ref.read(testStatusProvider.notifier).state = TestStatus.SHOW_ANSWER;
    ref.read(qCardVisibleProvider.notifier).state = true;
    ref.read(aCardVisibleProvider.notifier).state = true;
    ref.read(isFabVisibleProvider.notifier).state = false;
    ref.read(isAbleToPressProvider.notifier).state = false;
    if (selectedAnswer == correctAnswer) {
      ref.read(selectedACorrectProvider.notifier).state = true;
      ref.read(aCardVisibleProvider.notifier).state = true;
      await Future.delayed(Duration(seconds: 1));
      ref.read(adCountProvider.notifier).state--;
      if (ref.watch(adCountProvider) <= 0) {
        _loadInterstitialAd();
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
      ref.read(aCardVisibleProvider.notifier).state = true;
      await Future.delayed(Duration(seconds: 1));
      ref.read(adCountProvider.notifier).state--;
      if (ref.watch(adCountProvider) <= 0) {
        _loadInterstitialAd();
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

  void _initBannerAd() {
    bannerAd?.load();
  }

  void _initInterstitialAd() {
    final interstitialLoadAttemptP = ref.watch(interstitialNumProvider);
    InterstitialAd.load(
      adUnitId: AdManager.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          interstitialAd = ad;
          ref.read(interstitialNumProvider.notifier).state = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          interstitialAd = null;
          ref.read(interstitialNumProvider.notifier).state++;
          if (interstitialLoadAttemptP <= 3) _initInterstitialAd();
        },
      ),
    );
  }

  void _loadInterstitialAd() {
    if (interstitialAd == null) return;
    interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
      ad.dispose();
      _initInterstitialAd();
    }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
      ad.dispose();
      _initInterstitialAd();
    });
    interstitialAd!.show();
    interstitialAd = null;
  }

  void _loadBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdManager.bannerAdUnitId,
      listener: BannerAdListener(),
      request: AdRequest(),
    );
  }

  Widget adPart(BannerAd? bannerAd) {
    return Positioned(
      left: 20,
      right: 20,
      bottom: 8,
      child: (bannerAd == null)
          ? Container(width: 0, height: 0)
          : Container(
        width: bannerAd.size.width.toDouble(),
        height: bannerAd.size.height.toDouble(),
        child: AdWidget(ad: bannerAd),
      ),
    );
  }
}
