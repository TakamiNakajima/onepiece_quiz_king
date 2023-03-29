import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onepiece_quiz_king/data/series.dart';
import 'package:onepiece_quiz_king/db/database.dart';
import 'package:onepiece_quiz_king/main.dart';
import '../components/answer_card_part.dart';
import '../components/end_message.dart';
import '../components/number_of_question_part.dart';
import '../components/question_card_part.dart';
import '../components/testscreen_title_text.dart';

enum TestStatus { BEFORE_START, SHOW_QUESTION, SHOW_ANSWER, FINISHED }

class TestScreen extends StatefulWidget {
  SERIES series;

  TestScreen({required this.series});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int _numberOfQuestion = 0;
  String _txtQuestion = "問題";
  String _txtAnswer = "こたえ";

  bool isQuestionCardVisible = false;
  bool isAnswerCardVisible = false;
  bool isCheckBoxVisible = false;
  bool isFabVisible = false;
  // bool _isMemorized = false;

  List<Word> _testDataList = [];
  TestStatus _testStatus = TestStatus.BEFORE_START;

  int _index = 0; //いま何問目か
  late Word _currentWord = Word(
      strQuestion: "strQuestion",
      strAnswer: "strAnswer",
      isMemorized: false,
      series: 1,
      level: 1);

  @override
  void initState() {
    super.initState();
    _getTestData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        backgroundColor: Color(0xffffffff),
        navigationBar: CupertinoNavigationBar(
          middle: TextScreenTitleText(series: widget.series),
          backgroundColor: Color(0xfffcb860),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                //のこり問題数表示部分
                NumberOfQuestionPart(numberOfQuestion: _numberOfQuestion),
                SizedBox(height: 20),
                //問題カード表示部分
                QuestionCardPart(
                  isQuestionCardVisible: isQuestionCardVisible,
                  txtQuestion: _txtQuestion,
                  level: _currentWord.level,
                ),
                //こたえカード表示部分
                AnswerCardPart(
                  isAnswerCardVisible: isAnswerCardVisible,
                  txtAnswer: _txtAnswer,
                ),
                SizedBox(height: 40),
                //正解済みチェック部分
                // IsMeMorisedCheckPart(
                //   isCheckBoxVisible: isCheckBoxVisible,
                //   isMemorized: _isMemorized,
                // ),
              ],
            ),
            //次へボタン
            Positioned(right: 30, bottom: 60, child: _goNextButton()),
            //終了メッセージ
            EndMessage(testStatus: _testStatus),
          ],
        ),
      ),
    );
  }

  _goNextStatus() async {
    switch (_testStatus) {
      case TestStatus.BEFORE_START:
        _testStatus = TestStatus.SHOW_QUESTION;
        _showQuestion();
        break;
      case TestStatus.SHOW_QUESTION:
        _testStatus = TestStatus.SHOW_ANSWER;
        _showAnswer(_currentWord);
        break;
      case TestStatus.SHOW_ANSWER:
        // await _updateMemorizedFlag();
        if (_numberOfQuestion <= 0) {
          setState(() {
            isFabVisible = false;
            _testStatus = TestStatus.FINISHED;
          });
        } else {
          _testStatus = TestStatus.SHOW_QUESTION;
          _showQuestion();
        }
        break;
      case TestStatus.FINISHED:
        break;
    }
  }

  void _showQuestion() {
    _currentWord = _testDataList[_index];
    setState(() {
      isQuestionCardVisible = true;
      isAnswerCardVisible = false;
      isCheckBoxVisible = false;
      isFabVisible = true;
      _txtQuestion = _currentWord.strQuestion;
    });
    _numberOfQuestion -= 1;
    _index += 1;
  }

  void _showAnswer(_currentWord) {
    setState(() {
      isQuestionCardVisible = true;
      isAnswerCardVisible = true;
      isCheckBoxVisible = true;
      isFabVisible = true;
    });
    _txtAnswer = _currentWord.strAnswer;
    // _isMemorized = _currentWord.isMemorized;
  }

  void _getTestData() async {
    switch (widget.series) {
      case SERIES.ALL:
        _testDataList = await database.allWords;
        break;
      case SERIES.LEVEL1:
        _testDataList = await database.allWordsOflevel1;
        break;
      case SERIES.LEVEL2:
        _testDataList = await database.allWordsOflevel2;
        break;
      case SERIES.LEVEL3:
        _testDataList = await database.allWordsOflevel3;
        break;
      case SERIES.LEVEL4:
        _testDataList = await database.allWordsOflevel4;
        break;
      case SERIES.EASTBLUE:
        _testDataList = await database.seriesOfEastBlue;
        break;
      case SERIES.ALABASTA:
        _testDataList = await database.seriesOfAlaBasta;
        break;
      case SERIES.SKYISLAND:
        _testDataList = await database.seriesOfSkyIsland;
        break;
      case SERIES.WATERSEVEN:
        _testDataList = await database.seriesOfWaterSeven;
        break;
      case SERIES.THRILLERBARK:
        _testDataList = await database.seriesOfThrillerBark;
        break;
      case SERIES.IMPELDOWN:
        _testDataList = await database.seriesOfImpelDown;
        break;
      case SERIES.FISHMANISLAND:
        _testDataList = await database.seriesOfFishmanIsland;
        break;
      case SERIES.DRESSROSA:
        _testDataList = await database.seriesOfDressRosa;
        break;
      case SERIES.WHOLECAKEISLAND:
        _testDataList = await database.seriesOfWholeCakeIsland;
        break;
      case SERIES.WANOKUNI:
        _testDataList = await database.seriesOfWaNoKuni;
        break;
    }
    _testDataList.shuffle();
    _testStatus = TestStatus.BEFORE_START;
    _index = 0;

    setState(() {
      isQuestionCardVisible = false;
      isAnswerCardVisible = false;
      isCheckBoxVisible = false;
      isFabVisible = true;
      _numberOfQuestion = _testDataList.length;
    });
  }

  Widget _goNextButton() {
    return (isFabVisible && _testDataList.isNotEmpty)
        ? FloatingActionButton(
            onPressed: _goNextStatus,
            child: Icon(Icons.skip_next),
            backgroundColor: Color(0xfffcb860),
          )
        : Container();
  }
}
