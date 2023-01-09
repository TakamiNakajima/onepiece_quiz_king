import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onepiece_quiz_king/db/database.dart';
import 'package:onepiece_quiz_king/screens/home_screen.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:onepiece_quiz_king/db/database.dart';

late MyDatabase database;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var dbPath = await getDbPath();
  database = MyDatabase(dbPath: dbPath);

  runApp(MyApp());
  }

Future<String> getDbPath() async {
  var dbDir = await getApplicationDocumentsDirectory();
  var dbPath = join(dbDir.path, "words.db");

  if (FileSystemEntity.typeSync(dbPath) == FileSystemEntityType.notFound) {
    ByteData byteData = await rootBundle.load("assets/db/words1.db");
    List<int> bytes = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
    await File(dbPath).writeAsBytes(bytes);
  }
  return dbPath;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "麦ちゃんクイズ",
      theme: ThemeData(brightness: Brightness.light, fontFamily: "Lanobe"),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
