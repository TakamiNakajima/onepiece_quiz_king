import 'package:flutter/material.dart';
import 'package:onepiece_quiz_king/const/const.dart';
import 'package:onepiece_quiz_king/views/screens/test_2_screen.dart';

class EndMessage extends StatelessWidget {
  late TestStatus testStatus;

  EndMessage({required this.testStatus});

  @override
  Widget build(BuildContext context) {
    if (testStatus == TestStatus.FINISHED) {
      return Center(
          child: Text("クイズ終了", style: lanobeFinishTextStyle));
    } else {
      return Container();
    }
  }
}
