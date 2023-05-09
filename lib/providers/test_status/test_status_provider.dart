import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onepiece_quiz_king/enum/enum.dart';

final testStatusProvider = StateProvider<TestStatus>(
      (ref) => TestStatus.BEFORE_START,
);