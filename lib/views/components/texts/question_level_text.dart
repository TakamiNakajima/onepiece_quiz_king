import 'package:flutter/cupertino.dart';

class QuestionLevelText extends StatelessWidget {
  late int level;

  QuestionLevelText({required this.level});

  @override
  Widget build(BuildContext context) {
    if (level == 1) {
      return _testLevelText("レベル：初級");
    } else if (level == 2) {
      return _testLevelText("レベル：中級");
    } else if (level == 3) {
      return _testLevelText("レベル：上級");
    } else if (level == 4) {
      return _testLevelText("レベル：鬼");
    } else {
      return Text("");
    }
  }

  Widget _testLevelText(text) {
    return Text(text,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, fontFamily: "Mont"));
  }
}
