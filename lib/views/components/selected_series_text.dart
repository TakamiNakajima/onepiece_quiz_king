import 'package:flutter/cupertino.dart';
import '../../data/series.dart';

SelectedSeriesText({required SERIES selectedSeries}) {
  switch (selectedSeries) {
    case SERIES.ALL:
      return Text(
        "すべての問題",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xfffb5f66),
        ),
      );
    case SERIES.LEVEL1:
      return Text(
        "初級",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "Lanobe",
          color: Color(0xfffb5f66),
        ),
      );
    case SERIES.LEVEL2:
      return Text(
        "中級",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "Lanobe",
          color: Color(0xfffb5f66),
        ),
      );
    case SERIES.LEVEL3:
      return Text(
        "上級",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "Lanobe",
          color: Color(0xfffb5f66),
        ),
      );
    case SERIES.LEVEL4:
      return Text(
        "鬼",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "Lanobe",
          color: Color(0xfffb5f66),
        ),
      );
    case SERIES.EASTBLUE:
      return Text(
        "イーストブルー編",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "Lanobe",
          color: Color(0xfffb5f66),
        ),
      );
    case SERIES.ALABASTA:
      return Text(
        "アラバスタ編",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "Lanobe",
          color: Color(0xfffb5f66),
        ),
      );
    case SERIES.SKYISLAND:
      return Text(
        "ジャヤ&空島編",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "Lanobe",
          color: Color(0xfffb5f66),
        ),
      );
    case SERIES.WATERSEVEN:
      return Text(
        "ウォーターセブン&エニエスロビー編",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "Lanobe",
          color: Color(0xfffb5f66),
        ),
      );
    case SERIES.THRILLERBARK:
      return Text(
        "スリラーバーク&シャボンディ諸島編",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "Lanobe",
          color: Color(0xfffb5f66),
        ),
      );
    case SERIES.IMPELDOWN:
      return Text(
        "インペルダウン&マリンフォード編",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "Lanobe",
          color: Color(0xfffb5f66),
        ),
      );
    case SERIES.FISHMANISLAND:
      return Text(
        "魚人島&パンクハザード編",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "Lanobe",
          color: Color(0xfffb5f66),
        ),
      );
    case SERIES.DRESSROSA:
      return Text(
        "ドレスローザ編",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "Lanobe",
          color: Color(0xfffb5f66),
        ),
      );
    case SERIES.WHOLECAKEISLAND:
      return Text(
        "ゾウ&ホールケーキアイランド編",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "Lanobe",
          color: Color(0xfffb5f66),
        ),
      );
    case SERIES.WANOKUNI:
      return Text(
        "ワノ国編",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "Lanobe",
          color: Color(0xfffb5f66),
        ),
      );
  }
}
