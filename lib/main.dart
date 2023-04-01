import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onepiece_quiz_king/db/database.dart';
import 'package:onepiece_quiz_king/views/screens/home_screen.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

late MyDatabase database;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var dbPath = await getDbPath();
  database = MyDatabase(dbPath: dbPath);
  runApp(ProviderScope(child: MyApp()));
}

Future<String> getDbPath() async {
  var dbDir = await getApplicationDocumentsDirectory();
  var dbPath = join(dbDir.path, "words.db");

  ByteData byteData = await rootBundle.load("assets/db/words.db");
  List<int> bytes = byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
  await File(dbPath).writeAsBytes(bytes);
  return dbPath;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "麦わらクイズ",
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(textStyle: TextStyle(fontSize: 18)),
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
