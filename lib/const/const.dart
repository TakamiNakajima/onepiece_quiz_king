import 'package:flutter/material.dart';
import '../models/data/series.dart';

const List<DropdownMenuItem> DropDownItemList = [
  DropdownMenuItem<SERIES>(value: SERIES.ALL,
      child: Center(child: Text("すべての問題",
          style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700)))),
  DropdownMenuItem<SERIES>(value: null,
      child: Center(child: Text("レベル別", style: TextStyle(fontSize: 14,
          color: Colors.black26,
          fontFamily: "Mont",
          fontWeight: FontWeight.w400))),
      enabled: false),
  DropdownMenuItem<SERIES>(value: SERIES.LEVEL1,
      child: Center(child: Text("初級",
          style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700)))),
  DropdownMenuItem<SERIES>(value: SERIES.LEVEL2,
      child: Center(child: Text("中級",
          style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700)))),
  DropdownMenuItem<SERIES>(value: SERIES.LEVEL3,
      child: Center(child: Text("上級",
          style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700)))),
  DropdownMenuItem<SERIES>(value: SERIES.LEVEL4,
      child: Center(child: Text("鬼",
          style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700)))),
  DropdownMenuItem<SERIES>(value: null,
      child: Center(child: Text("シリーズ別", style: TextStyle(fontSize: 14,
          color: Colors.black26,
          fontFamily: "Mont",
          fontWeight: FontWeight.w400))),
      enabled: false),
  DropdownMenuItem<SERIES>(value: SERIES.EASTBLUE,
      child: Center(child: Text("イーストブルー編",
          style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700)))),
  DropdownMenuItem<SERIES>(value: SERIES.ALABASTA,
      child: Center(child: Text("アラバスタ編",
          style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700)))),
  DropdownMenuItem<SERIES>(value: SERIES.SKYISLAND,
      child: Center(child: Text("ジャヤ&空島編",
          style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700)))),
  DropdownMenuItem<SERIES>(value: SERIES.WATERSEVEN,
      child: Center(child: Text("ウォーターセブン&エニエスロビー編",
          style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700)))),
  DropdownMenuItem<SERIES>(value: SERIES.THRILLERBARK,
      child: Center(child: Text("スリラーバーク&シャボンディ諸島編",
          style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700)))),
  DropdownMenuItem<SERIES>(value: SERIES.IMPELDOWN,
      child: Center(child: Text("インペルダウン&マリンフォード編",
          style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700)))),
  DropdownMenuItem<SERIES>(value: SERIES.FISHMANISLAND,
      child: Center(child: Text("魚人島&パンクハザード編",
          style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700)))),
  DropdownMenuItem<SERIES>(value: SERIES.DRESSROSA,
      child: Center(child: Text("ドレスローザ編",
          style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700)))),
  DropdownMenuItem<SERIES>(value: SERIES.WHOLECAKEISLAND,
      child: Center(child: Text("ゾウ&ホールケーキアイランド編",
          style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700)))),
  DropdownMenuItem<SERIES>(value: SERIES.WANOKUNI,
      child: Center(child: Text("ワノ国編",
          style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700)))),
];

//テキストスタイル
const lanobeLargeTitleTextStyle = TextStyle(fontSize: 56, color: mainColor, fontFamily: Lanobe);
const lanobeMediumTextStyle = TextStyle(fontSize: 16, color: Colors.white, fontFamily: Lanobe);
const lanobeQuestionTextStyle = TextStyle(fontSize: 18, color: Colors.black87, fontFamily: Lanobe);
const lanobeAnswerTextStyle = TextStyle(fontSize: 18, fontFamily: Lanobe, color: redColor);
const lanobeFinishTextStyle = TextStyle(fontSize: 60, color: mainColor);
const lanobeNumberOfQLargeTextStyle = TextStyle(fontSize: 20, fontFamily: Lanobe, color: Colors.black);
const montMediumTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: Mont, color: mainColor);
const montNumberOfQSmallTextStyle = TextStyle(fontSize: 16, fontFamily: Mont, color: Colors.black);
const montSmallTextStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: Mont);

//カラー
const mainColor = Color(0xff733917);
const subColor = Color(0xffF2D6A2);
const redColor = Color(0xfffb5f66);
const whiteColor = Color(0xffffffff);

//フォント
const Mont = "Mont";
const Lanobe = "Lanobe";