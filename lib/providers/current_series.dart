import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onepiece_quiz_king/enum/enum.dart';

final currentSeriesProvider = StateProvider<SERIES>(
      (ref) => SERIES.ALL,
);