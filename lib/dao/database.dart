import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

part 'database.g.dart';

class Words extends Table {
  TextColumn get strQuestion => text()();
  TextColumn get strAnswer => text()();
  BoolColumn get isMemorized => boolean().withDefault(const Constant(false))();
  IntColumn get series => integer()();
  IntColumn get level => integer()();
  TextColumn get fakeFirst => text()();
  TextColumn get fakeSecond => text()();
}

@DriftDatabase(tables: [Words])
class MyDatabase extends _$MyDatabase {
  final String dbPath;

  MyDatabase({required this.dbPath}) : super(_openConnection(dbPath));

  @override
  int get schemaVersion => 3;

  //Read(全ての問題)
  Future<List<Word>> get allWords => select(words).get();

  //Read(イーストブルー編)
  Future<List<Word>> get seriesOfEastBlue =>
      (select(words)..where((table) => table.series.equals(1))).get();

  //Read(アラバスタ編)
  Future<List<Word>> get seriesOfAlaBasta =>
      (select(words)..where((table) => table.series.equals(2))).get();

  //Read(ジャヤ,空島編)
  Future<List<Word>> get seriesOfSkyIsland =>
      (select(words)..where((table) => table.series.equals(3))).get();

  //Read(ウォーターセブン編)
  Future<List<Word>> get seriesOfWaterSeven =>
      (select(words)..where((table) => table.series.equals(4))).get();

  //Read(スリラーバーク編)
  Future<List<Word>> get seriesOfThrillerBark =>
      (select(words)..where((table) => table.series.equals(5))).get();

  //Read(インペルダウン編)
  Future<List<Word>> get seriesOfImpelDown =>
      (select(words)..where((table) => table.series.equals(6))).get();

  //Read(魚人島編)
  Future<List<Word>> get seriesOfFishmanIsland =>
      (select(words)..where((table) => table.series.equals(7))).get();

  //Read(ドレスローザ編)
  Future<List<Word>> get seriesOfDressRosa =>
      (select(words)..where((table) => table.series.equals(8))).get();

  //Read(ホールケーキアイランド編)
  Future<List<Word>> get seriesOfWholeCakeIsland =>
      (select(words)..where((table) => table.series.equals(9))).get();

  //Read(ワノ国編)
  Future<List<Word>> get seriesOfWaNoKuni =>
      (select(words)..where((table) => table.series.equals(10))).get();
}

LazyDatabase _openConnection(String dbPath) {
  return LazyDatabase(() async {
    final file = File(dbPath);
    return NativeDatabase.createInBackground(file);
  });
}
