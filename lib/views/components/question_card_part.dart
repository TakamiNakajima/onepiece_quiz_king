import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onepiece_quiz_king/views/components/question_level_text.dart';

class QuestionCardPart extends StatefulWidget {
  bool isQuestionCardVisible;
  String txtQuestion;
  var level;

  QuestionCardPart(
      {required this.isQuestionCardVisible,
      required this.txtQuestion,
      required this.level});

  @override
  State<QuestionCardPart> createState() => _QuestionCardPartState();
}

class _QuestionCardPartState extends State<QuestionCardPart> {
  @override
  Widget build(BuildContext context) {
    if (widget.isQuestionCardVisible) {
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
                    child: Text(widget.txtQuestion,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontFamily: "Lanobe",
                        )),
                  ),
                  QuestionLevelText(level: widget.level),
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
