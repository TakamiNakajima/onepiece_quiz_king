import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onepiece_quiz_king/const/const.dart';
import 'package:onepiece_quiz_king/db/database.dart';
import 'package:onepiece_quiz_king/models/data/series.dart';
import 'package:onepiece_quiz_king/main.dart';
import 'package:onepiece_quiz_king/view_models/main_view_model.dart';
import 'package:onepiece_quiz_king/views/components/buttons/ad_part.dart';
import 'package:onepiece_quiz_king/views/components/buttons/go_next_button.dart';
import '../components/answer_card_part.dart';
import '../components/end_message.dart';
import '../components/number_of_question_part.dart';
import '../components/question_card_part.dart';
import '../components/texts/testscreen_title_text.dart';

enum TestStatus { BEFORE_START, SHOW_QUESTION, SHOW_ANSWER, FINISHED }

class TestScreen extends StatefulWidget {
  SERIES series;
  TestScreen({required this.series});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  MainViewModel _mainViewModel = MainViewModel();
  Word currentWord = Word(
    strQuestion: "",
    strAnswer: "",
    isMemorized: false,
    series: 1,
    level: 1,
  );

  @override
  void initState() {
    super.initState();
    _getTestData();
    _mainViewModel.getBannerAd();
    _mainViewModel.loadBannerAd();
    _mainViewModel.initInterstitialAd(_mainViewModel.interstitialAd);
  }

  @override
  void dispose() {
    super.dispose();
    _mainViewModel.bannerAd?.dispose();
    _mainViewModel.interstitialAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                NumberOfQuestionPart(numberOfQuestion: _mainViewModel.numberOfQuestion),
                SizedBox(height: 20),
                // 問題カード表示部分
                QuestionCardPart(
                  isQuestionCardVisible: _mainViewModel.isQuestionCardVisible,
                  txtQuestion: _mainViewModel.txtQuestion,
                  level: currentWord.level,
                ),
                //こたえカード表示部分
                AnswerCardPart(
                  isAnswerCardVisible: _mainViewModel.isAnswerCardVisible,
                  txtAnswer: _mainViewModel.txtAnswer,
                ),
                SizedBox(height: 40),
              ],
            ),
            //次へボタン
            Positioned(
              right: 30,
              bottom: 70,
              child: GoNextButton(
                isFabVisible: _mainViewModel.isFabVisible,
                testDataList: _mainViewModel.testDataList,
                onPressed: () => _goNextStatus(),
              ),
            ),
            //終了メッセージ
            EndMessage(testStatus: _mainViewModel.testStatus),
            AdPart(bannerAd: _mainViewModel.bannerAd),
          ],
        ),
      ),
    );
  }

  _goNextStatus() async {
    switch (_mainViewModel.testStatus) {
      case TestStatus.BEFORE_START:
        _mainViewModel.testStatus = TestStatus.SHOW_QUESTION;
        _showQuestion();
        break;
      case TestStatus.SHOW_QUESTION:
        _mainViewModel.testStatus = TestStatus.SHOW_ANSWER;
        _mainViewModel.adCount--;
        if (_mainViewModel.adCount <= 0) {
          _mainViewModel.loadInterstitialAd(_mainViewModel.interstitialAd);
          _mainViewModel.adCount = 5;
        }
        _showAnswer(currentWord);
        break;
      case TestStatus.SHOW_ANSWER:
        // await _updateMemorizedFlag();
        if (_mainViewModel.numberOfQuestion <= 0) {
          setState(() {
            _mainViewModel.isFabVisible = false;
            _mainViewModel.testStatus = TestStatus.FINISHED;
          });
        } else {
          _mainViewModel.testStatus = TestStatus.SHOW_QUESTION;
          _showQuestion();
        }
        break;
      case TestStatus.FINISHED:
        break;
    }
  }

  void _showQuestion() {
    currentWord = _mainViewModel.testDataList[_mainViewModel.index];
    setState(() {
      _mainViewModel.changeStatusOnShowQuestion(currentWord);
    });
    _mainViewModel.numberOfQuestion -= 1;
    _mainViewModel.index += 1;
  }

  void _showAnswer(currentWord) {
    setState(() {
      _mainViewModel.changeStatusOnShowAnswer();
    });
    _mainViewModel.txtAnswer = currentWord.strAnswer;
  }

  void _getTestData() async {
    switch (widget.series) {
      case SERIES.ALL:
        _mainViewModel.testDataList = await database.allWords;
        break;
      case SERIES.LEVEL1:
        _mainViewModel.testDataList = await database.allWordsOflevel1;
        break;
      case SERIES.LEVEL2:
        _mainViewModel.testDataList = await database.allWordsOflevel2;
        break;
      case SERIES.LEVEL3:
        _mainViewModel.testDataList = await database.allWordsOflevel3;
        break;
      case SERIES.LEVEL4:
        _mainViewModel.testDataList = await database.allWordsOflevel4;
        break;
      case SERIES.EASTBLUE:
        _mainViewModel.testDataList = await database.seriesOfEastBlue;
        break;
      case SERIES.ALABASTA:
        _mainViewModel.testDataList = await database.seriesOfAlaBasta;
        break;
      case SERIES.SKYISLAND:
        _mainViewModel.testDataList = await database.seriesOfSkyIsland;
        break;
      case SERIES.WATERSEVEN:
        _mainViewModel.testDataList = await database.seriesOfWaterSeven;
        break;
      case SERIES.THRILLERBARK:
        _mainViewModel.testDataList = await database.seriesOfThrillerBark;
        break;
      case SERIES.IMPELDOWN:
        _mainViewModel.testDataList = await database.seriesOfImpelDown;
        break;
      case SERIES.FISHMANISLAND:
        _mainViewModel.testDataList = await database.seriesOfFishmanIsland;
        break;
      case SERIES.DRESSROSA:
        _mainViewModel.testDataList = await database.seriesOfDressRosa;
        break;
      case SERIES.WHOLECAKEISLAND:
        _mainViewModel.testDataList = await database.seriesOfWholeCakeIsland;
        break;
      case SERIES.WANOKUNI:
        _mainViewModel.testDataList = await database.seriesOfWaNoKuni;
        break;
    }
    _mainViewModel.testDataList.shuffle();
    _mainViewModel.testStatus = TestStatus.BEFORE_START;
    _mainViewModel.index = 0;

    setState(() {
      _mainViewModel.isQuestionCardVisible = false;
      _mainViewModel.isAnswerCardVisible = false;
      _mainViewModel.isCheckBoxVisible = false;
      _mainViewModel.isFabVisible = true;
      _mainViewModel.numberOfQuestion = _mainViewModel.testDataList.length;
    });
  }
}
