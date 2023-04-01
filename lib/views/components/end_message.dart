import 'package:flutter/material.dart';
import '../screens/test_screen.dart';

class EndMessage extends StatelessWidget {
  late TestStatus testStatus;

  EndMessage({required this.testStatus});

  @override
  Widget build(BuildContext context) {
    if (testStatus == TestStatus.FINISHED) {
      return Center(
          child: Text("クイズ終了",
              style: TextStyle(fontSize: 60, color: Colors.grey[800])));
    } else {
      return Container();
    };
  }
}
