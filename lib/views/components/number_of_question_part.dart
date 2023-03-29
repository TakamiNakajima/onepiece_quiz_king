import 'package:flutter/cupertino.dart';

class NumberOfQuestionPart extends StatefulWidget {
  var numberOfQuestion;

  NumberOfQuestionPart({required this.numberOfQuestion});

  @override
  State<NumberOfQuestionPart> createState() => _NumberOfQuestionPartState();
}

class _NumberOfQuestionPartState extends State<NumberOfQuestionPart> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("残り", style: TextStyle(fontSize: 16, fontFamily: "Mont")),
        SizedBox(width: 8),
        Text("${widget.numberOfQuestion.toString()}問",
            style: TextStyle(
                fontSize: 20, fontFamily: "Lanobe", fontWeight: FontWeight.w600)),
      ],
    );
  }
}