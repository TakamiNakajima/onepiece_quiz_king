import 'package:flutter/material.dart';

class GoNextButton extends StatelessWidget {
  final bool isFabVisible;
  final List testDataList;
  final onPressed;

  GoNextButton(
      {required this.isFabVisible,
      required this.testDataList,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return (isFabVisible && testDataList.isNotEmpty)
        ? Positioned(
            right: 30,
            bottom: 70,
            child: FloatingActionButton(
              onPressed: onPressed,
              child: Icon(Icons.skip_next),
              backgroundColor: Color(0xff733917),
            ),
          )
        : Container();
  }
}
