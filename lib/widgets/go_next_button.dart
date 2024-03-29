import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onepiece_quiz_king/states/providers.dart';

class GoNextButton extends ConsumerWidget {
  final VoidCallback onPressed;
  GoNextButton(this.onPressed);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testDataList = ref.watch(testDataListProvider);
    final isFabVisible = ref.watch(isFabVisibleProvider);
    return (isFabVisible && testDataList.isNotEmpty)
        ? Positioned(
            right: 30,
            bottom: 70,
            child: FloatingActionButton(
              onPressed: onPressed,
              child: const Icon(Icons.skip_next),
              backgroundColor: const Color(0xff733917),
            ),
          )
        : Container();
  }
}
