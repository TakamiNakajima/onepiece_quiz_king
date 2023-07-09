import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onepiece_quiz_king/config/app_text_style.dart';
import 'package:onepiece_quiz_king/states/test_status_provider.dart';
import 'package:onepiece_quiz_king/utils/enum.dart';

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
