import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onepiece_quiz_king/views/screens/test_2_screen.dart';

final testStatusProvider = StateProvider<TestStatus>(
      (ref) => TestStatus.BEFORE_START,
);