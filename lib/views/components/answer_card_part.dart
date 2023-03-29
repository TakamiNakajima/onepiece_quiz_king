import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnswerCardPart extends StatefulWidget {
  bool isAnswerCardVisible;
  String txtAnswer;

  AnswerCardPart({required this.isAnswerCardVisible, required this.txtAnswer});

  @override
  State<AnswerCardPart> createState() => _AnswerCardPartState();
}

class _AnswerCardPartState extends State<AnswerCardPart> {
  @override
  Widget build(BuildContext context) {
    if (widget.isAnswerCardVisible) {
      return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 16),
        child: Card(
          elevation: 4,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xfffb5f66), width: 1.5),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "A. ${widget.txtAnswer}",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Lanobe",
                      color: Color(0xfffb5f66),
                    ),
                  ),
                ],
              )),
            ),
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
