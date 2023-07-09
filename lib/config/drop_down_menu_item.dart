import 'package:flutter/material.dart';
import 'package:onepiece_quiz_king/utils/enum.dart';

const List<DropdownMenuItem> DropDownItemList = [
  DropdownMenuItem<SERIES>(
    value: SERIES.ALL,
    child: Center(
      child: Text(
        "すべての問題",
        style: TextStyle(
            color: Colors.black,
            fontFamily: "Mont",
            fontWeight: FontWeight.w700),
      ),
    ),
  ),
  DropdownMenuItem<SERIES>(
      value: null,
      child: Center(
          child: Text("シリーズ別",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black26,
                  fontFamily: "Mont",
                  fontWeight: FontWeight.w400))),
      enabled: false),
  DropdownMenuItem<SERIES>(
      value: SERIES.EASTBLUE,
      child: Center(
          child: Text("イーストブルー編",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Mont",
                  fontWeight: FontWeight.w700)))),
  DropdownMenuItem<SERIES>(
      value: SERIES.ALABASTA,
      child: Center(
          child: Text("アラバスタ編",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Mont",
                  fontWeight: FontWeight.w700)))),
  DropdownMenuItem<SERIES>(
      value: SERIES.SKYISLAND,
      child: Center(
          child: Text("ジャヤ&空島編",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Mont",
                  fontWeight: FontWeight.w700)))),
  DropdownMenuItem<SERIES>(
      value: SERIES.WATERSEVEN,
      child: Center(
          child: Text("ウォーターセブン&エニエスロビー編",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Mont",
                  fontWeight: FontWeight.w700)))),
  DropdownMenuItem<SERIES>(
      value: SERIES.THRILLERBARK,
      child: Center(
          child: Text("スリラーバーク&シャボンディ諸島編",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Mont",
                  fontWeight: FontWeight.w700)))),
  DropdownMenuItem<SERIES>(
      value: SERIES.IMPELDOWN,
      child: Center(
          child: Text("インペルダウン&マリンフォード編",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Mont",
                  fontWeight: FontWeight.w700)))),
  DropdownMenuItem<SERIES>(
      value: SERIES.FISHMANISLAND,
      child: Center(
          child: Text("魚人島&パンクハザード編",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Mont",
                  fontWeight: FontWeight.w700)))),
  DropdownMenuItem<SERIES>(
      value: SERIES.DRESSROSA,
      child: Center(
          child: Text("ドレスローザ編",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Mont",
                  fontWeight: FontWeight.w700)))),
  DropdownMenuItem<SERIES>(
      value: SERIES.WHOLECAKEISLAND,
      child: Center(
          child: Text("ゾウ&ホールケーキアイランド編",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Mont",
                  fontWeight: FontWeight.w700)))),
  DropdownMenuItem<SERIES>(
      value: SERIES.WANOKUNI,
      child: Center(
          child: Text("ワノ国編",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Mont",
                  fontWeight: FontWeight.w700)))),
];
