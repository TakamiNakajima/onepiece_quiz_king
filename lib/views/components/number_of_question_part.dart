import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onepiece_quiz_king/const/const.dart';

class NumberOfQuestionPart extends StatelessWidget {
  late int numberOfQuestion;

  NumberOfQuestionPart({required this.numberOfQuestion});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("残り", style: montNumberOfQSmallTextStyle),
        SizedBox(width: 8),
        Text("${numberOfQuestion.toString()}問",
            style: lanobeNumberOfQLargeTextStyle),
      ],
    );
  }
}