// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class Word extends DataClass implements Insertable<Word> {
  final String strQuestion;
  final String strAnswer;
  final bool isMemorized;
  final int series;
  final int level;
  const Word(
      {required this.strQuestion,
      required this.strAnswer,
      required this.isMemorized,
      required this.series,
      required this.level});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['str_question'] = Variable<String>(strQuestion);
    map['str_answer'] = Variable<String>(strAnswer);
    map['is_memorized'] = Variable<bool>(isMemorized);
    map['series'] = Variable<int>(series);
    map['level'] = Variable<int>(level);
    return map;
  }

  WordsCompanion toCompanion(bool nullToAbsent) {
    return WordsCompanion(
      strQuestion: Value(strQuestion),
      strAnswer: Value(strAnswer),
      isMemorized: Value(isMemorized),
      series: Value(series),
      level: Value(level),
    );
  }

  factory Word.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Word(
      strQuestion: serializer.fromJson<String>(json['strQuestion']),
      strAnswer: serializer.fromJson<String>(json['strAnswer']),
      isMemorized: serializer.fromJson<bool>(json['isMemorized']),
      series: serializer.fromJson<int>(json['series']),
      level: serializer.fromJson<int>(json['level']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'strQuestion': serializer.toJson<String>(strQuestion),
      'strAnswer': serializer.toJson<String>(strAnswer),
      'isMemorized': serializer.toJson<bool>(isMemorized),
      'series': serializer.toJson<int>(series),
      'level': serializer.toJson<int>(level),
    };
  }

  Word copyWith(
          {String? strQuestion,
          String? strAnswer,
          bool? isMemorized,
          int? series,
          int? level}) =>
      Word(
        strQuestion: strQuestion ?? this.strQuestion,
        strAnswer: strAnswer ?? this.strAnswer,
        isMemorized: isMemorized ?? this.isMemorized,
        series: series ?? this.series,
        level: level ?? this.level,
      );
  @override
  String toString() {
    return (StringBuffer('Word(')
          ..write('strQuestion: $strQuestion, ')
          ..write('strAnswer: $strAnswer, ')
          ..write('isMemorized: $isMemorized, ')
          ..write('series: $series, ')
          ..write('level: $level')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(strQuestion, strAnswer, isMemorized, series, level);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Word &&
          other.strQuestion == this.strQuestion &&
          other.strAnswer == this.strAnswer &&
          other.isMemorized == this.isMemorized &&
          other.series == this.series &&
          other.level == this.level);
}

class WordsCompanion extends UpdateCompanion<Word> {
  final Value<String> strQuestion;
  final Value<String> strAnswer;
  final Value<bool> isMemorized;
  final Value<int> series;
  final Value<int> level;
  const WordsCompanion({
    this.strQuestion = const Value.absent(),
    this.strAnswer = const Value.absent(),
    this.isMemorized = const Value.absent(),
    this.series = const Value.absent(),
    this.level = const Value.absent(),
  });
  WordsCompanion.insert({
    required String strQuestion,
    required String strAnswer,
    this.isMemorized = const Value.absent(),
    required int series,
    required int level,
  })  : strQuestion = Value(strQuestion),
        strAnswer = Value(strAnswer),
        series = Value(series),
        level = Value(level);
  static Insertable<Word> custom({
    Expression<String>? strQuestion,
    Expression<String>? strAnswer,
    Expression<bool>? isMemorized,
    Expression<int>? series,
    Expression<int>? level,
  }) {
    return RawValuesInsertable({
      if (strQuestion != null) 'str_question': strQuestion,
      if (strAnswer != null) 'str_answer': strAnswer,
      if (isMemorized != null) 'is_memorized': isMemorized,
      if (series != null) 'series': series,
      if (level != null) 'level': level,
    });
  }

  WordsCompanion copyWith(
      {Value<String>? strQuestion,
      Value<String>? strAnswer,
      Value<bool>? isMemorized,
      Value<int>? series,
      Value<int>? level}) {
    return WordsCompanion(
      strQuestion: strQuestion ?? this.strQuestion,
      strAnswer: strAnswer ?? this.strAnswer,
      isMemorized: isMemorized ?? this.isMemorized,
      series: series ?? this.series,
      level: level ?? this.level,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (strQuestion.present) {
      map['str_question'] = Variable<String>(strQuestion.value);
    }
    if (strAnswer.present) {
      map['str_answer'] = Variable<String>(strAnswer.value);
    }
    if (isMemorized.present) {
      map['is_memorized'] = Variable<bool>(isMemorized.value);
    }
    if (series.present) {
      map['series'] = Variable<int>(series.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordsCompanion(')
          ..write('strQuestion: $strQuestion, ')
          ..write('strAnswer: $strAnswer, ')
          ..write('isMemorized: $isMemorized, ')
          ..write('series: $series, ')
          ..write('level: $level')
          ..write(')'))
        .toString();
  }
}

class $WordsTable extends Words with TableInfo<$WordsTable, Word> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _strQuestionMeta =
      const VerificationMeta('strQuestion');
  @override
  late final GeneratedColumn<String> strQuestion = GeneratedColumn<String>(
      'str_question', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _strAnswerMeta =
      const VerificationMeta('strAnswer');
  @override
  late final GeneratedColumn<String> strAnswer = GeneratedColumn<String>(
      'str_answer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isMemorizedMeta =
      const VerificationMeta('isMemorized');
  @override
  late final GeneratedColumn<bool> isMemorized =
      GeneratedColumn<bool>('is_memorized', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_memorized" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: Constant(false));
  static const VerificationMeta _seriesMeta = const VerificationMeta('series');
  @override
  late final GeneratedColumn<int> series = GeneratedColumn<int>(
      'series', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
      'level', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [strQuestion, strAnswer, isMemorized, series, level];
  @override
  String get aliasedName => _alias ?? 'words';
  @override
  String get actualTableName => 'words';
  @override
  VerificationContext validateIntegrity(Insertable<Word> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('str_question')) {
      context.handle(
          _strQuestionMeta,
          strQuestion.isAcceptableOrUnknown(
              data['str_question']!, _strQuestionMeta));
    } else if (isInserting) {
      context.missing(_strQuestionMeta);
    }
    if (data.containsKey('str_answer')) {
      context.handle(_strAnswerMeta,
          strAnswer.isAcceptableOrUnknown(data['str_answer']!, _strAnswerMeta));
    } else if (isInserting) {
      context.missing(_strAnswerMeta);
    }
    if (data.containsKey('is_memorized')) {
      context.handle(
          _isMemorizedMeta,
          isMemorized.isAcceptableOrUnknown(
              data['is_memorized']!, _isMemorizedMeta));
    }
    if (data.containsKey('series')) {
      context.handle(_seriesMeta,
          series.isAcceptableOrUnknown(data['series']!, _seriesMeta));
    } else if (isInserting) {
      context.missing(_seriesMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Word map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Word(
      strQuestion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}str_question'])!,
      strAnswer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}str_answer'])!,
      isMemorized: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_memorized'])!,
      series: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}series'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}level'])!,
    );
  }

  @override
  $WordsTable createAlias(String alias) {
    return $WordsTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $WordsTable words = $WordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [words];
}
