import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberOfQuestionPart extends StatelessWidget {
  late int numberOfQuestion;

  NumberOfQuestionPart({required this.numberOfQuestion});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("残り", style: TextStyle(fontSize: 16, fontFamily: "Mont", color: Colors.black)),
        SizedBox(width: 8),
        Text("${numberOfQuestion.toString()}問",
            style: TextStyle(
                fontSize: 20, fontFamily: "Lanobe", fontWeight: FontWeight.w600, color: Colors.black)),
      ],
    );
  }
}