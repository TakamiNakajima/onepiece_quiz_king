import 'package:flutter/material.dart';

class IsMeMorisedCheckPart extends StatefulWidget {
  late bool isCheckBoxVisible;
  late bool isMemorized;

  IsMeMorisedCheckPart(
      {required this.isCheckBoxVisible, required this.isMemorized});

  @override
  State<IsMeMorisedCheckPart> createState() => _IsMeMorisedCheckPartState();
}

class _IsMeMorisedCheckPartState extends State<IsMeMorisedCheckPart> {
  @override
  Widget build(BuildContext context) {
    if (widget.isCheckBoxVisible) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: CheckboxListTile(
            title: Text("正解したらチェックしてください"),
            value: widget.isMemorized,
            onChanged: (value) {
              setState(() {
                widget.isMemorized = value!;
              });
            }),
      );
    } else {
      return Container();
    }
  }
}
