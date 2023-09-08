import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onepiece_quiz_king/config/app_colors.dart';
import 'package:onepiece_quiz_king/config/app_text_style.dart';
import 'package:onepiece_quiz_king/states/answer_list_provider.dart';
import 'package:onepiece_quiz_king/states/is_able_to_press_provider.dart';

class ListItem extends ConsumerWidget {
  final int index;
  final VoidCallback onTap;

  ListItem({required this.index, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAbleToPress = ref.watch(isAbleToPressProvider);
    final answersList = ref.watch(answersListProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8.0),
      child: Material(
        color: subColor,
        child: InkWell(
          onTap: isAbleToPress
              ? onTap
              : null,
          child: Card(
            elevation: 4,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                    color: redColor, width: 1.5),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      Text(answersList[index], style: lanobeAnswerTextStyle),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}