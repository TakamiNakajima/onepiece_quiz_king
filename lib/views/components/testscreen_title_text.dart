import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onepiece_quiz_king/data/series.dart';

class TextScreenTitleText extends StatefulWidget {
  SERIES series;

  TextScreenTitleText({required this.series});

  @override
  State<TextScreenTitleText> createState() => _TextScreenTitleTextState();
}

class _TextScreenTitleTextState extends State<TextScreenTitleText> {
  @override
  Widget build(BuildContext context) {
    if (widget.series == SERIES.ALL) {
      return Text("すべての問題", style: TextStyle(fontSize: 18, color: Colors.white));
    } else if (widget.series == SERIES.LEVEL1) {
      return Text("初級", style: TextStyle(fontSize: 18, color: Colors.white));
    } else if (widget.series == SERIES.LEVEL2) {
      return Text("中級", style: TextStyle(fontSize: 18, color: Colors.white));
    } else if (widget.series == SERIES.LEVEL3) {
      return Text("上級", style: TextStyle(fontSize: 18, color: Colors.white));
    } else if (widget.series == SERIES.LEVEL4) {
      return Text("鬼", style: TextStyle(fontSize: 18, color: Colors.white));
    } else if (widget.series == SERIES.EASTBLUE) {
      return Text("イーストブルー編", style: TextStyle(fontSize: 18, color: Colors.white));
    } else if (widget.series == SERIES.ALABASTA) {
      return Text("アラバスタ編", style: TextStyle(fontSize: 18, color: Colors.white));
    } else if (widget.series == SERIES.SKYISLAND) {
      return Text("ジャヤ,空島編", style: TextStyle(fontSize: 18, color: Colors.white));
    } else if (widget.series == SERIES.WATERSEVEN) {
      return Text("ウォーターセブン,エニエスロビー編", style: TextStyle(fontSize: 18, color: Colors.white));
    } else if (widget.series == SERIES.THRILLERBARK) {
      return Text("スリラーバーク,シャボンディ諸島編", style: TextStyle(fontSize: 18, color: Colors.white));
    } else if (widget.series == SERIES.IMPELDOWN) {
      return Text("インペルダウン,マリンフォード編", style: TextStyle(fontSize: 18, color: Colors.white));
    } else if (widget.series == SERIES.FISHMANISLAND) {
      return Text("魚人島,パンクハザード編", style: TextStyle(fontSize: 18, color: Colors.white));
    } else if (widget.series == SERIES.DRESSROSA) {
      return Text("ドレスローザ編", style: TextStyle(fontSize: 18, color: Colors.white));
    } else if (widget.series == SERIES.WHOLECAKEISLAND) {
      return Text("ゾウ,ホールケーキアイランド編", style: TextStyle(fontSize: 18, color: Colors.white));
    } else if (widget.series == SERIES.WANOKUNI) {
      return Text("ワノ国編", style: TextStyle(fontSize: 18, color: Colors.white));
    }
    return Text("麦わらクイズ", style: TextStyle(fontSize: 18, color: Colors.white));
  }
}