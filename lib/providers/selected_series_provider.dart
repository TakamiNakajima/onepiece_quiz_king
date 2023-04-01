import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/data/series.dart';

final selectedSeriesProvider = StateProvider<SERIES>((ref) {
  return SERIES.ALL;
});