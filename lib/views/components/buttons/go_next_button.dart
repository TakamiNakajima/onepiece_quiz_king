import 'package:flutter/material.dart';

class GoNextButton extends StatelessWidget {
  final bool isFabVisible;
  final List testDataList;
  final onPressed;

  GoNextButton({required this.isFabVisible, required this.testDataList , required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return (isFabVisible && testDataList.isNotEmpty)
        ? FloatingActionButton(
            onPressed: onPressed,
            child: Icon(Icons.skip_next),
            backgroundColor: Color(0xff733917),
          )
        : Container();
  }
}
