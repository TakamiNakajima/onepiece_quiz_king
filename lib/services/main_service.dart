
import 'package:onepiece_quiz_king/dao/database.dart';

class MainService {

  late Word currentWord = Word(
    strQuestion: "",
    strAnswer: "",
    isMemorized: false,
    series: 1,
    level: 1,
    fakeFirst: '',
    fakeSecond: '',
  );

}