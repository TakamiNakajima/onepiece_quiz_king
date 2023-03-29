import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/test_screen.dart';

class EndMessage extends StatefulWidget {
  TestStatus testStatus;

  EndMessage({required this.testStatus});

  @override
  State<EndMessage> createState() => _EndMessageState();
}

class _EndMessageState extends State<EndMessage> {
  @override
  Widget build(BuildContext context) {
    if (widget.testStatus == TestStatus.FINISHED) {
      return Center(
          child: Text("クイズ終了",
              style: TextStyle(fontSize: 60, color: Colors.grey[800])));
    } else {
      return Container();
    };
  }
}
