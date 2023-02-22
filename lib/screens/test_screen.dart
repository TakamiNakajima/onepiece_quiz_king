import 'package:flutter/material.dart';
import 'package:onepiece_quiz_king/db/database.dart';
import 'package:onepiece_quiz_king/main.dart';

enum TestStatus { BEFORE_START, SHOW_QUESTION, SHOW_ANSWER, FINISHED }

class TestScreen extends StatefulWidget {
  final bool isIncludedMemorizedWords;

  TestScreen({required this.isIncludedMemorizedWords});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int _numberOfQuestion = 0;
  String _txtQuestion = "問題";
  String _txtAnswer = "こたえ";
  bool _isMemorized = false;

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
    if (widget.isIncludedMemorizedWords) {
      _testDataList = await database.allWords;
    } else {
      _testDataList = await database.allWordsExcludedMemorized;
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
        title: Text("麦わらクイズ"),
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
            child: Text(_txtQuestion, style: TextStyle(fontSize: 18, color: Colors.grey[800])),
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
                    style: TextStyle(fontSize: 30, color: Color(0xfffb5f66), decoration: TextDecoration.underline)),
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
    _isMemorized = _currentWord.isMemorized;
  }

  Widget _endMessage() {
    if(TestStatus == TestStatus.FINISHED) {
      return Center(child: Text("クイズ終了", style: TextStyle(fontSize: 60, color: Colors.grey[800])));
    } else {
      return Container();
    }
  }

  // Future<void> _updateMemorizedFlag() async {
  //   var updateWord = Word(
  //       strQuestion: _currentWord.strQuestion,
  //       strAnswer: _currentWord.strAnswer,
  //       isMemorized: _isMemorized);
  //   await database.updateWord(updateWord);
  // }
}
