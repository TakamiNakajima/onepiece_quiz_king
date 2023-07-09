import 'package:flutter/cupertino.dart';
import 'package:onepiece_quiz_king/config/app_text_style.dart';

class QuestionLevelText extends StatelessWidget {
  late int level;

  QuestionLevelText({required this.level});

  @override
  Widget build(BuildContext context) {
    if (level == 1) {
      return _testLevelText("レベル：1");
    } else if (level == 2) {
      return _testLevelText("レベル：2");
    } else if (level == 3) {
      return _testLevelText("レベル：3");
    } else if (level == 4) {
      return _testLevelText("レベル：4");
    } else {
      return Text("");
    }
  }

  Widget _testLevelText(text) {
    return Text(text, style: montSmallTextStyle);
  }
}
