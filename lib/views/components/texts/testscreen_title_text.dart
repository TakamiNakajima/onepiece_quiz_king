import 'package:flutter/material.dart';
import 'package:onepiece_quiz_king/const/const.dart';
import 'package:onepiece_quiz_king/models/data/series.dart';

class TestScreenTitleText extends StatelessWidget {
  late SERIES series;

  TestScreenTitleText({required this.series});

  @override
  Widget build(BuildContext context) {
    if (series == SERIES.ALL) {
      return testTitleText("全ての問題");
    } else if (series == SERIES.LEVEL1) {
      return testTitleText("初級");
    } else if (series == SERIES.LEVEL2) {
      return testTitleText("中級");
    } else if (series == SERIES.LEVEL3) {
      return testTitleText("上級");
    } else if (series == SERIES.LEVEL4) {
      return testTitleText("鬼");
    } else if (series == SERIES.EASTBLUE) {
      return testTitleText("イーストブルー編");
    } else if (series == SERIES.ALABASTA) {
      return testTitleText("アラバスタ編");
    } else if (series == SERIES.SKYISLAND) {
      return testTitleText("ジャヤ,空島編");
    } else if (series == SERIES.WATERSEVEN) {
      return testTitleText("ウォーターセブン,エニエスロビー編");
    } else if (series == SERIES.THRILLERBARK) {
      return testTitleText("スリラーバーク,シャボンディ諸島編");
    } else if (series == SERIES.IMPELDOWN) {
      return testTitleText("インペルダウン,マリンフォード編");
    } else if (series == SERIES.FISHMANISLAND) {
      return testTitleText("魚人島,パンクハザード編");
    } else if (series == SERIES.DRESSROSA) {
      return testTitleText("ドレスローザ編");
    } else if (series == SERIES.WHOLECAKEISLAND) {
      return testTitleText("ゾウ,ホールケーキアイランド編");
    } else if (series == SERIES.WANOKUNI) {
      return testTitleText("ワノ国編");
    }
    return testTitleText("麦わらクイズ");
  }

  Widget testTitleText(String text) {
    return Text(text, style: lanobeMediumTextStyle);
  }
}
