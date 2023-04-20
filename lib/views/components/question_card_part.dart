import 'package:flutter/material.dart';
import 'package:onepiece_quiz_king/const/const.dart';
import 'package:onepiece_quiz_king/views/components/texts/question_level_text.dart';

class QuestionCardPart extends StatelessWidget {
  late bool isQuestionCardVisible;
  late String txtQuestion;
  late int level;

  QuestionCardPart(
      {required this.isQuestionCardVisible,
      required this.txtQuestion,
      required this.level});

  @override
  Widget build(BuildContext context) {
    if (isQuestionCardVisible) {
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Card(
          elevation: 4,
          child: Container(
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xfffcb860), width: 1.5),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(txtQuestion,
                        textAlign: TextAlign.left,
                        style: lanobeQuestionTextStyle),
                  ),
                  QuestionLevelText(level: level),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
