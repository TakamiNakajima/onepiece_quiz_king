import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onepiece_quiz_king/const/const.dart';
import 'package:onepiece_quiz_king/providers/bool/q_card_visible_provider.dart';
import 'package:onepiece_quiz_king/providers/string/question_txt_provider.dart';
import 'package:onepiece_quiz_king/view_model/main_view_model.dart';
import 'package:onepiece_quiz_king/views/components/texts/question_level_text.dart';

class QuestionCardPart extends ConsumerWidget {
  MainViewModel _mainViewModel = MainViewModel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isQCardVisible = ref.watch(qCardVisibleProvider);
    final questionText = ref.watch(qTxtProvider);
    if (isQCardVisible) {
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Card(
          elevation: 4,
          child: Container(
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(color: mainColor, width: 1.5),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 310,
                        child: Text(questionText,
                            textAlign: TextAlign.left,
                            style: lanobeQuestionTextStyle),
                      ),
                    ],
                  ),
                  QuestionLevelText(level: _mainViewModel.currentWord.level),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
