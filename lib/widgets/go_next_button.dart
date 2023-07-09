import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onepiece_quiz_king/states/is_fab_visible_provider.dart';
import 'package:onepiece_quiz_king/states/test_data_list_provider.dart';

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
              child: Icon(Icons.skip_next),
              backgroundColor: Color(0xff733917),
            ),
          )
        : Container();
  }
}
