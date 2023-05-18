import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onepiece_quiz_king/const/const.dart';
import 'package:onepiece_quiz_king/providers/int/number_of_question_provider.dart';

class NumberOfQuestionPart extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberOfQ = ref.watch(numberOfQuestionProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("残り", style: montNumberOfQSmallTextStyle),
        SizedBox(width: 8),
        Text("${numberOfQ.toString()}問",
            style: lanobeNumberOfQLargeTextStyle),
      ],
    );
  }
}