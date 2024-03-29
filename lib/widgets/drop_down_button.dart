import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onepiece_quiz_king/config/app_colors.dart';
import 'package:onepiece_quiz_king/config/drop_down_menu_item.dart';
import 'package:onepiece_quiz_king/states/providers.dart';
import 'package:onepiece_quiz_king/widgets/selected_series_text.dart';

class DropDownButton extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final series = ref.watch(currentSeriesProvider);
    return SizedBox(
      height: 44,
      width: MediaQuery.of(context).size.width * 7 / 10,
      child: ElevatedButton(
        onPressed: () => showCupertinoModalPopup(
          context: context,
          builder: (_) => SizedBox(
            width: double.infinity,
            height: 300,
            child: CupertinoPicker(
              backgroundColor: Colors.white,
              itemExtent: 36,
              scrollController: FixedExtentScrollController(
                initialItem: 1,
              ),
              children: DropDownItemList,
              onSelectedItemChanged: (int value) {
                if (DropDownItemList[value].value != null) {
                  ref.read(currentSeriesProvider.notifier).state = DropDownItemList[value].value;
                }
              },
            ),
          ),
        ),
        child: SelectedSeriesText(selectedSeries: series),
        style: ElevatedButton.styleFrom(
          backgroundColor: subColor,
        ),
      ),
    );
  }
}
