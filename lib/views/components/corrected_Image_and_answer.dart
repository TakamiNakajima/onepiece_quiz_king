import 'package:flutter/material.dart';
import 'package:onepiece_quiz_king/const/const.dart';
import 'package:onepiece_quiz_king/db/database.dart';

class CorrectedImageAndAnswer extends StatelessWidget {
  final bool isCorrected;
  final Word currentWord;

  CorrectedImageAndAnswer({required this.isCorrected, required this.currentWord});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width,
          color: Colors.black54,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isCorrected
                  ? Image.asset("assets/images/pic_correct.png")
                  : Image.asset("assets/images/pic_incorrect.png"),
              SizedBox(height: 30),
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text("答え 『${currentWord.strAnswer}』",
                        style: AnswerTextStyle),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
