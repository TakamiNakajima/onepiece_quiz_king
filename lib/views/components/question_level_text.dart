import 'package:flutter/cupertino.dart';

class QuestionLevelText extends StatefulWidget {
  var level;

  QuestionLevelText({required this.level});

  @override
  State<QuestionLevelText> createState() => _QuestionLevelTextState();
}

class _QuestionLevelTextState extends State<QuestionLevelText> {
  @override
  Widget build(BuildContext context) {
    if (widget.level == 1) {
      return Text("レベル：初級",
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, fontFamily: "Mont"));
    } else if (widget.level == 2) {
      return Text("レベル：中級",
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, fontFamily: "Mont"));
    } else if (widget.level == 3) {
      return Text("レベル：上級",
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, fontFamily: "Mont"));
    } else if (widget.level == 4) {
      return Text("レベル：鬼",
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, fontFamily: "Mont"));
    } else {
      return Text("");
    }
  }
}
