import 'package:flutter/material.dart';
import '../data/series.dart';

const List<DropdownMenuItem> DropDownItemList = [
  DropdownMenuItem<SERIES>(value: SERIES.ALL, child: Text("すべての問題", style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700))),
  DropdownMenuItem<SERIES>(value: null, child: Text("レベル別", style: TextStyle(fontSize:14, color: Colors.black26, fontFamily: "Mont", fontWeight: FontWeight.w400)), enabled: false),
  DropdownMenuItem<SERIES>(value: SERIES.LEVEL1, child: Text("初級", style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700))),
  DropdownMenuItem<SERIES>(value: SERIES.LEVEL2, child: Text("中級", style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700))),
  DropdownMenuItem<SERIES>(value: SERIES.LEVEL3, child: Text("上級", style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700))),
  DropdownMenuItem<SERIES>(value: SERIES.LEVEL4, child: Text("鬼", style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700))),
  DropdownMenuItem<SERIES>(value: null, child: Text("シリーズ別", style: TextStyle(fontSize:14, color: Colors.black26, fontFamily: "Mont", fontWeight: FontWeight.w400)), enabled: false),
  DropdownMenuItem<SERIES>(value: SERIES.EASTBLUE, child: Text("イーストブルー編", style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700))),
  DropdownMenuItem<SERIES>(value: SERIES.ALABASTA, child: Text("アラバスタ編", style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700))),
  DropdownMenuItem<SERIES>(value: SERIES.SKYISLAND, child: Text("ジャヤ&空島編", style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700))),
  DropdownMenuItem<SERIES>(value: SERIES.WATERSEVEN, child: Text("ウォーターセブン&エニエスロビー編", style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700))),
  DropdownMenuItem<SERIES>(value: SERIES.THRILLERBARK, child: Text("スリラーバーク&シャボンディ諸島編", style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700))),
  DropdownMenuItem<SERIES>(value: SERIES.IMPELDOWN, child: Text("インペルダウン&マリンフォード編", style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700))),
  DropdownMenuItem<SERIES>(value: SERIES.FISHMANISLAND, child: Text("魚人島&パンクハザード編", style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700))),
  DropdownMenuItem<SERIES>(value: SERIES.DRESSROSA, child: Text("ドレスローザ編", style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700))),
  DropdownMenuItem<SERIES>(value: SERIES.WHOLECAKEISLAND, child: Text("ゾウ&ホールケーキアイランド編", style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700))),
  DropdownMenuItem<SERIES>(value: SERIES.WANOKUNI, child: Text("ワノ国編", style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.w700))),
];