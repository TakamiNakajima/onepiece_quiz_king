import 'package:flutter/material.dart';
import 'package:onepiece_quiz_king/const/const.dart';

class AnswerCardPart extends StatelessWidget {
  late bool isAnswerCardVisible;
  late String txtAnswer;

  AnswerCardPart({required this.isAnswerCardVisible, required this.txtAnswer});

  @override
  Widget build(BuildContext context) {
    if (isAnswerCardVisible) {
      return Card(
        elevation: 4,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff733917), width: 1.5),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "A. $txtAnswer",
                  style: lanobeAnswerTextStyle,
                ),
              ],
            )),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 16),
        child: Container(
          height: 64,
        ),
      );
    }
  }
}
