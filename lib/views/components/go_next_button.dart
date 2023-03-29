import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoNextButton extends StatefulWidget {
  bool isFabVisible;
  List testDataList;
  VoidCallback onPressed;

  GoNextButton({
    required this.isFabVisible,
    required this.testDataList,
    required this.onPressed,
  });

  @override
  State<GoNextButton> createState() => _GoNextButtonState();
}

class _GoNextButtonState extends State<GoNextButton> {
  @override
  Widget build(BuildContext context) {
    return (widget.isFabVisible && widget.testDataList.isNotEmpty)
        ? TextButton(
            onPressed: widget.onPressed,
            child: Text("次へ", style: (TextStyle(fontSize: 16))),
          )
        : Container();
  }
}
