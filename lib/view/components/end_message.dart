import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onepiece_quiz_king/const/const.dart';
import 'package:onepiece_quiz_king/enum/enum.dart';
import 'package:onepiece_quiz_king/provider/test_status_provider.dart';

class EndMessage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testStatus = ref.watch(testStatusProvider);
    if (testStatus == TestStatus.FINISHED) {
      return Center(
          child: Text("クイズ終了", style: lanobeFinishTextStyle));
    } else {
      return Container();
    }
  }
}
