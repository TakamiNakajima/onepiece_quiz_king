import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onepiece_quiz_king/const/const.dart';
import 'package:onepiece_quiz_king/provider/current_series.dart';
import 'package:onepiece_quiz_king/view/components/texts/selected_series_text.dart';

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
              itemExtent: 40,
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
