import 'package:flutter/material.dart';
import 'package:onepiece_quiz_king/data/series.dart';
import 'package:onepiece_quiz_king/db/database.dart';
import 'package:onepiece_quiz_king/main.dart';

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

  List<Word> _testDataList = [];
  TestStatus _testStatus = TestStatus.BEFORE_START;

  int _index = 0; //いま何問目か
  late Word _currentWord;

  @override
  void initState() {
    super.initState();
    _getTestData();
  }

  void _getTestData() async {
    if (widget.series == SERIES.ALL) {
      _testDataList = await database.allWords;
    } else if (widget.series == SERIES.EASTBLUE) {
      _testDataList = await database.seriesOfEastBlue;
    } else if (widget.series == SERIES.ALABASTA) {
      _testDataList = await database.seriesOfAlaBasta;
    } else if (widget.series == SERIES.SKYISLAND) {
      _testDataList = await database.seriesOfSkyIsland;
    } else if (widget.series == SERIES.WATERSEVEN) {
      _testDataList = await database.seriesOfWaterSeven;
    } else if (widget.series == SERIES.THRILLERBARK) {
      _testDataList = await database.seriesOfThrillerBark;
    } else if (widget.series == SERIES.IMPELDOWN) {
      _testDataList = await database.seriesOfImpelDown;
    } else if (widget.series == SERIES.FISHMANISLAND) {
      _testDataList = await database.seriesOfFishmanIsland;
    } else if (widget.series == SERIES.DRESSROSA) {
      _testDataList = await database.seriesOfDressRosa;
    } else if (widget.series == SERIES.WHOLECAKEISLAND) {
      _testDataList = await database.seriesOfWholeCakeIsland;
    } else if (widget.series == SERIES.WANOKUNI) {
      _testDataList = await database.seriesOfWaNoKuni;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        title: _titleText(),
        centerTitle: true,
        backgroundColor: Color(0xfffcb860),
      ),
      floatingActionButton: (isFabVisible && _testDataList.isNotEmpty)
          ? FloatingActionButton(
        onPressed: () => _goNextStatus(),
        child: Icon(Icons.skip_next),
        tooltip: "次にすすむ",
        backgroundColor: Color(0xfffcb860),
      )
          : null,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 20),
              //のこり問題数表示部分
              _numberOfQuestionPart(),
              SizedBox(height: 20),
              //問題カード表示部分
              _questionCardPart(),
              //こたえカード表示部分
              _answerCardPart(),
              SizedBox(height: 10),
              //正解済みチェック部分
              // _isMemorizedCheckPart(),
            ],
          ),
          _endMessage(),
        ],
      ),
    );
  }

  //のこり問題数表示部分
  Widget _numberOfQuestionPart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("のこり問題数", style: TextStyle(fontSize: 14, color: Colors.grey[800])),
        SizedBox(width: 20),
        Text(_numberOfQuestion.toString(), style: TextStyle(fontSize: 24)),
      ],
    );
  }

  //問題カード表示部分
  Widget _questionCardPart() {
    if (isQuestionCardVisible) {
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xfffcb860)),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Container(
            child: Text(_txtQuestion,
                style: TextStyle(fontSize: 18, color: Colors.grey[800])),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  //こたえカード表示部分
  Widget _answerCardPart() {
    if (isAnswerCardVisible) {
      return Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("答え",
                    style: TextStyle(fontSize: 20, color: Colors.grey[800])),
                SizedBox(height: 32),
                Text("$_txtAnswer",
                    style: TextStyle(fontSize: 30,
                        color: Color(0xfffb5f66),
                        decoration: TextDecoration.underline)),
              ],
            )),
      );
    } else {
      return Container();
    }
  }

  //正解済みチェック部分
  // Widget _isMemorizedCheckPart() {
  //   if (isCheckBoxVisible) {
  //     return Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 30),
  //       child: CheckboxListTile(
  //           title: Text("正解したらチェックしてください"),
  //           value: _isMemorized,
  //           onChanged: (value) {
  //             setState(() {
  //               _isMemorized = value!;
  //             });
  //           }),
  //     );
  //   } else {
  //     return Container();
  //   }
  // }

  _goNextStatus() async {
    switch (_testStatus) {
      case TestStatus.BEFORE_START:
        _testStatus = TestStatus.SHOW_QUESTION;
        _showQuestion();
        break;
      case TestStatus.SHOW_QUESTION:
        _testStatus = TestStatus.SHOW_ANSWER;
        _showAnswer();
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

  void _showAnswer() {
    setState(() {
      isQuestionCardVisible = true;
      isAnswerCardVisible = true;
      isCheckBoxVisible = true;
      isFabVisible = true;
    });
    _txtAnswer = _currentWord.strAnswer;
    // _isMemorized = _currentWord.isMemorized;
  }

  Widget _endMessage() {
    if (TestStatus == TestStatus.FINISHED) {
      return Center(child: Text(
          "クイズ終了", style: TextStyle(fontSize: 60, color: Colors.grey[800])));
    } else {
      return Container();
    }
  }

  Widget _titleText() {
    if (widget.series == SERIES.ALL) {
      return Text("すべての問題", style: TextStyle(fontSize: 18));
    } else if (widget.series == SERIES.EASTBLUE) {
      return Text("イーストブルー編", style: TextStyle(fontSize: 18));
    } else if (widget.series == SERIES.ALABASTA) {
      return Text("アラバスタ編", style: TextStyle(fontSize: 18));
    } else if (widget.series == SERIES.SKYISLAND) {
      return Text("ジャヤ,空島編", style: TextStyle(fontSize: 18));
    } else if (widget.series == SERIES.WATERSEVEN) {
      return Text("ウォーターセブン,エニエスロビー編", style: TextStyle(fontSize: 18));
    } else if (widget.series == SERIES.THRILLERBARK) {
      return Text("スリラーバーク,シャボンディ諸島編", style: TextStyle(fontSize: 18));
    } else if (widget.series == SERIES.IMPELDOWN) {
      return Text("インペルダウン,マリンフォード編", style: TextStyle(fontSize: 18));
    } else if (widget.series == SERIES.FISHMANISLAND) {
      return Text("魚人島,パンクハザード編", style: TextStyle(fontSize: 18));
    } else if (widget.series == SERIES.DRESSROSA) {
      return Text("ドレスローザ編", style: TextStyle(fontSize: 18));
    } else if (widget.series == SERIES.WHOLECAKEISLAND) {
      return Text("ゾウ,ホールケーキアイランド編", style: TextStyle(fontSize: 18));
    } else if (widget.series == SERIES.WANOKUNI) {
      return Text("ワノ国編", style: TextStyle(fontSize: 18));
    }
    return Text("麦わらクイズ", style: TextStyle(fontSize: 18));
  }
}
