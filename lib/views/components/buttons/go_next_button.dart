import 'package:flutter/material.dart';

class GoNextButton extends StatelessWidget {
  late bool isFabVisible;
  late List testDataList;
  late VoidCallback onPressed;

  GoNextButton({
    required this.isFabVisible,
    required this.testDataList,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return (isFabVisible && testDataList.isNotEmpty)
        ? TextButton(
            onPressed: onPressed,
            child: Text("次へ", style: (TextStyle(fontSize: 16))),
          )
        : Container();
  }
}
