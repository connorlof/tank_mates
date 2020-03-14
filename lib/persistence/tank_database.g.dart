// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tank_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Tank extends DataClass implements Insertable<Tank> {
  final int id;
  final String name;
  final int gallons;
  final String status;
  final int percentFilled;
  final List<String> recommendationList;
  final String fishList;
  final List<String> fishJson;
  final int numFish;
  Tank(
      {@required this.id,
      @required this.name,
      @required this.gallons,
      @required this.status,
      @required this.percentFilled,
      this.recommendationList,
      @required this.fishList,
      this.fishJson,
      @required this.numFish});
  factory Tank.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Tank(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      gallons:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}gallons']),
      status:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
      percentFilled: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}percent_filled']),
      recommendationList: $TanksTable.$converter0.mapToDart(
          stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}recommendation_list'])),
      fishList: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}fish_list']),
      fishJson: $TanksTable.$converter1.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}fish_json'])),
      numFish:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}num_fish']),
    );
  }
  factory Tank.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Tank(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      gallons: serializer.fromJson<int>(json['gallons']),
      status: serializer.fromJson<String>(json['status']),
      percentFilled: serializer.fromJson<int>(json['percentFilled']),
      recommendationList:
          serializer.fromJson<List<String>>(json['recommendationList']),
      fishList: serializer.fromJson<String>(json['fishList']),
      fishJson: serializer.fromJson<List<String>>(json['fishJson']),
      numFish: serializer.fromJson<int>(json['numFish']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'gallons': serializer.toJson<int>(gallons),
      'status': serializer.toJson<String>(status),
      'percentFilled': serializer.toJson<int>(percentFilled),
      'recommendationList': serializer.toJson<List<String>>(recommendationList),
      'fishList': serializer.toJson<String>(fishList),
      'fishJson': serializer.toJson<List<String>>(fishJson),
      'numFish': serializer.toJson<int>(numFish),
    };
  }

  @override
  TanksCompanion createCompanion(bool nullToAbsent) {
    return TanksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      gallons: gallons == null && nullToAbsent
          ? const Value.absent()
          : Value(gallons),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      percentFilled: percentFilled == null && nullToAbsent
          ? const Value.absent()
          : Value(percentFilled),
      recommendationList: recommendationList == null && nullToAbsent
          ? const Value.absent()
          : Value(recommendationList),
      fishList: fishList == null && nullToAbsent
          ? const Value.absent()
          : Value(fishList),
      fishJson: fishJson == null && nullToAbsent
          ? const Value.absent()
          : Value(fishJson),
      numFish: numFish == null && nullToAbsent
          ? const Value.absent()
          : Value(numFish),
    );
  }

  Tank copyWith(
          {int id,
          String name,
          int gallons,
          String status,
          int percentFilled,
          List<String> recommendationList,
          String fishList,
          List<String> fishJson,
          int numFish}) =>
      Tank(
        id: id ?? this.id,
        name: name ?? this.name,
        gallons: gallons ?? this.gallons,
        status: status ?? this.status,
        percentFilled: percentFilled ?? this.percentFilled,
        recommendationList: recommendationList ?? this.recommendationList,
        fishList: fishList ?? this.fishList,
        fishJson: fishJson ?? this.fishJson,
        numFish: numFish ?? this.numFish,
      );
  @override
  String toString() {
    return (StringBuffer('Tank(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('gallons: $gallons, ')
          ..write('status: $status, ')
          ..write('percentFilled: $percentFilled, ')
          ..write('recommendationList: $recommendationList, ')
          ..write('fishList: $fishList, ')
          ..write('fishJson: $fishJson, ')
          ..write('numFish: $numFish')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              gallons.hashCode,
              $mrjc(
                  status.hashCode,
                  $mrjc(
                      percentFilled.hashCode,
                      $mrjc(
                          recommendationList.hashCode,
                          $mrjc(
                              fishList.hashCode,
                              $mrjc(
                                  fishJson.hashCode, numFish.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Tank &&
          other.id == this.id &&
          other.name == this.name &&
          other.gallons == this.gallons &&
          other.status == this.status &&
          other.percentFilled == this.percentFilled &&
          other.recommendationList == this.recommendationList &&
          other.fishList == this.fishList &&
          other.fishJson == this.fishJson &&
          other.numFish == this.numFish);
}

class TanksCompanion extends UpdateCompanion<Tank> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> gallons;
  final Value<String> status;
  final Value<int> percentFilled;
  final Value<List<String>> recommendationList;
  final Value<String> fishList;
  final Value<List<String>> fishJson;
  final Value<int> numFish;
  const TanksCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.gallons = const Value.absent(),
    this.status = const Value.absent(),
    this.percentFilled = const Value.absent(),
    this.recommendationList = const Value.absent(),
    this.fishList = const Value.absent(),
    this.fishJson = const Value.absent(),
    this.numFish = const Value.absent(),
  });
  TanksCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required int gallons,
    @required String status,
    @required int percentFilled,
    this.recommendationList = const Value.absent(),
    @required String fishList,
    this.fishJson = const Value.absent(),
    @required int numFish,
  })  : name = Value(name),
        gallons = Value(gallons),
        status = Value(status),
        percentFilled = Value(percentFilled),
        fishList = Value(fishList),
        numFish = Value(numFish);
  TanksCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<int> gallons,
      Value<String> status,
      Value<int> percentFilled,
      Value<List<String>> recommendationList,
      Value<String> fishList,
      Value<List<String>> fishJson,
      Value<int> numFish}) {
    return TanksCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      gallons: gallons ?? this.gallons,
      status: status ?? this.status,
      percentFilled: percentFilled ?? this.percentFilled,
      recommendationList: recommendationList ?? this.recommendationList,
      fishList: fishList ?? this.fishList,
      fishJson: fishJson ?? this.fishJson,
      numFish: numFish ?? this.numFish,
    );
  }
}

class $TanksTable extends Tanks with TableInfo<$TanksTable, Tank> {
  final GeneratedDatabase _db;
  final String _alias;
  $TanksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 0, maxTextLength: 50);
  }

  final VerificationMeta _gallonsMeta = const VerificationMeta('gallons');
  GeneratedIntColumn _gallons;
  @override
  GeneratedIntColumn get gallons => _gallons ??= _constructGallons();
  GeneratedIntColumn _constructGallons() {
    return GeneratedIntColumn(
      'gallons',
      $tableName,
      false,
    );
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedTextColumn _status;
  @override
  GeneratedTextColumn get status => _status ??= _constructStatus();
  GeneratedTextColumn _constructStatus() {
    return GeneratedTextColumn('status', $tableName, false,
        minTextLength: 0, maxTextLength: 50);
  }

  final VerificationMeta _percentFilledMeta =
      const VerificationMeta('percentFilled');
  GeneratedIntColumn _percentFilled;
  @override
  GeneratedIntColumn get percentFilled =>
      _percentFilled ??= _constructPercentFilled();
  GeneratedIntColumn _constructPercentFilled() {
    return GeneratedIntColumn(
      'percent_filled',
      $tableName,
      false,
    );
  }

  final VerificationMeta _recommendationListMeta =
      const VerificationMeta('recommendationList');
  GeneratedTextColumn _recommendationList;
  @override
  GeneratedTextColumn get recommendationList =>
      _recommendationList ??= _constructRecommendationList();
  GeneratedTextColumn _constructRecommendationList() {
    return GeneratedTextColumn(
      'recommendation_list',
      $tableName,
      true,
    );
  }

  final VerificationMeta _fishListMeta = const VerificationMeta('fishList');
  GeneratedTextColumn _fishList;
  @override
  GeneratedTextColumn get fishList => _fishList ??= _constructFishList();
  GeneratedTextColumn _constructFishList() {
    return GeneratedTextColumn('fish_list', $tableName, false,
        minTextLength: 0, maxTextLength: 5000);
  }

  final VerificationMeta _fishJsonMeta = const VerificationMeta('fishJson');
  GeneratedTextColumn _fishJson;
  @override
  GeneratedTextColumn get fishJson => _fishJson ??= _constructFishJson();
  GeneratedTextColumn _constructFishJson() {
    return GeneratedTextColumn(
      'fish_json',
      $tableName,
      true,
    );
  }

  final VerificationMeta _numFishMeta = const VerificationMeta('numFish');
  GeneratedIntColumn _numFish;
  @override
  GeneratedIntColumn get numFish => _numFish ??= _constructNumFish();
  GeneratedIntColumn _constructNumFish() {
    return GeneratedIntColumn(
      'num_fish',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        gallons,
        status,
        percentFilled,
        recommendationList,
        fishList,
        fishJson,
        numFish
      ];
  @override
  $TanksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tanks';
  @override
  final String actualTableName = 'tanks';
  @override
  VerificationContext validateIntegrity(TanksCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (d.gallons.present) {
      context.handle(_gallonsMeta,
          gallons.isAcceptableValue(d.gallons.value, _gallonsMeta));
    } else if (isInserting) {
      context.missing(_gallonsMeta);
    }
    if (d.status.present) {
      context.handle(
          _statusMeta, status.isAcceptableValue(d.status.value, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (d.percentFilled.present) {
      context.handle(
          _percentFilledMeta,
          percentFilled.isAcceptableValue(
              d.percentFilled.value, _percentFilledMeta));
    } else if (isInserting) {
      context.missing(_percentFilledMeta);
    }
    context.handle(_recommendationListMeta, const VerificationResult.success());
    if (d.fishList.present) {
      context.handle(_fishListMeta,
          fishList.isAcceptableValue(d.fishList.value, _fishListMeta));
    } else if (isInserting) {
      context.missing(_fishListMeta);
    }
    context.handle(_fishJsonMeta, const VerificationResult.success());
    if (d.numFish.present) {
      context.handle(_numFishMeta,
          numFish.isAcceptableValue(d.numFish.value, _numFishMeta));
    } else if (isInserting) {
      context.missing(_numFishMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tank map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Tank.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TanksCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.gallons.present) {
      map['gallons'] = Variable<int, IntType>(d.gallons.value);
    }
    if (d.status.present) {
      map['status'] = Variable<String, StringType>(d.status.value);
    }
    if (d.percentFilled.present) {
      map['percent_filled'] = Variable<int, IntType>(d.percentFilled.value);
    }
    if (d.recommendationList.present) {
      final converter = $TanksTable.$converter0;
      map['recommendation_list'] = Variable<String, StringType>(
          converter.mapToSql(d.recommendationList.value));
    }
    if (d.fishList.present) {
      map['fish_list'] = Variable<String, StringType>(d.fishList.value);
    }
    if (d.fishJson.present) {
      final converter = $TanksTable.$converter1;
      map['fish_json'] =
          Variable<String, StringType>(converter.mapToSql(d.fishJson.value));
    }
    if (d.numFish.present) {
      map['num_fish'] = Variable<int, IntType>(d.numFish.value);
    }
    return map;
  }

  @override
  $TanksTable createAlias(String alias) {
    return $TanksTable(_db, alias);
  }

  static TypeConverter<List<String>, String> $converter0 =
      const ListColumnConverter();
  static TypeConverter<List<String>, String> $converter1 =
      const ListColumnConverter();
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TanksTable _tanks;
  $TanksTable get tanks => _tanks ??= $TanksTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tanks];
}
