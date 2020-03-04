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
  final String aggressiveness;
  final double phMin;
  final double phMax;
  final int tempMin;
  final int tempMax;
  final int hardnessMin;
  final int hardnessMax;
  final String careLevel;
  final int percentFilled;
  final String recommendationList;
  final String fishList;
  final String fishJson;
  final int numFish;
  Tank(
      {@required this.id,
      @required this.name,
      @required this.gallons,
      @required this.status,
      @required this.aggressiveness,
      @required this.phMin,
      @required this.phMax,
      @required this.tempMin,
      @required this.tempMax,
      @required this.hardnessMin,
      @required this.hardnessMax,
      @required this.careLevel,
      @required this.percentFilled,
      @required this.recommendationList,
      @required this.fishList,
      @required this.fishJson,
      @required this.numFish});
  factory Tank.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Tank(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      gallons:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}gallons']),
      status:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
      aggressiveness: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}aggressiveness']),
      phMin:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}ph_min']),
      phMax:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}ph_max']),
      tempMin:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}temp_min']),
      tempMax:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}temp_max']),
      hardnessMin: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}hardness_min']),
      hardnessMax: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}hardness_max']),
      careLevel: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}care_level']),
      percentFilled: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}percent_filled']),
      recommendationList: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}recommendation_list']),
      fishList: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}fish_list']),
      fishJson: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}fish_json']),
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
      aggressiveness: serializer.fromJson<String>(json['aggressiveness']),
      phMin: serializer.fromJson<double>(json['phMin']),
      phMax: serializer.fromJson<double>(json['phMax']),
      tempMin: serializer.fromJson<int>(json['tempMin']),
      tempMax: serializer.fromJson<int>(json['tempMax']),
      hardnessMin: serializer.fromJson<int>(json['hardnessMin']),
      hardnessMax: serializer.fromJson<int>(json['hardnessMax']),
      careLevel: serializer.fromJson<String>(json['careLevel']),
      percentFilled: serializer.fromJson<int>(json['percentFilled']),
      recommendationList:
          serializer.fromJson<String>(json['recommendationList']),
      fishList: serializer.fromJson<String>(json['fishList']),
      fishJson: serializer.fromJson<String>(json['fishJson']),
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
      'aggressiveness': serializer.toJson<String>(aggressiveness),
      'phMin': serializer.toJson<double>(phMin),
      'phMax': serializer.toJson<double>(phMax),
      'tempMin': serializer.toJson<int>(tempMin),
      'tempMax': serializer.toJson<int>(tempMax),
      'hardnessMin': serializer.toJson<int>(hardnessMin),
      'hardnessMax': serializer.toJson<int>(hardnessMax),
      'careLevel': serializer.toJson<String>(careLevel),
      'percentFilled': serializer.toJson<int>(percentFilled),
      'recommendationList': serializer.toJson<String>(recommendationList),
      'fishList': serializer.toJson<String>(fishList),
      'fishJson': serializer.toJson<String>(fishJson),
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
      aggressiveness: aggressiveness == null && nullToAbsent
          ? const Value.absent()
          : Value(aggressiveness),
      phMin:
          phMin == null && nullToAbsent ? const Value.absent() : Value(phMin),
      phMax:
          phMax == null && nullToAbsent ? const Value.absent() : Value(phMax),
      tempMin: tempMin == null && nullToAbsent
          ? const Value.absent()
          : Value(tempMin),
      tempMax: tempMax == null && nullToAbsent
          ? const Value.absent()
          : Value(tempMax),
      hardnessMin: hardnessMin == null && nullToAbsent
          ? const Value.absent()
          : Value(hardnessMin),
      hardnessMax: hardnessMax == null && nullToAbsent
          ? const Value.absent()
          : Value(hardnessMax),
      careLevel: careLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(careLevel),
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
          String aggressiveness,
          double phMin,
          double phMax,
          int tempMin,
          int tempMax,
          int hardnessMin,
          int hardnessMax,
          String careLevel,
          int percentFilled,
          String recommendationList,
          String fishList,
          String fishJson,
          int numFish}) =>
      Tank(
        id: id ?? this.id,
        name: name ?? this.name,
        gallons: gallons ?? this.gallons,
        status: status ?? this.status,
        aggressiveness: aggressiveness ?? this.aggressiveness,
        phMin: phMin ?? this.phMin,
        phMax: phMax ?? this.phMax,
        tempMin: tempMin ?? this.tempMin,
        tempMax: tempMax ?? this.tempMax,
        hardnessMin: hardnessMin ?? this.hardnessMin,
        hardnessMax: hardnessMax ?? this.hardnessMax,
        careLevel: careLevel ?? this.careLevel,
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
          ..write('aggressiveness: $aggressiveness, ')
          ..write('phMin: $phMin, ')
          ..write('phMax: $phMax, ')
          ..write('tempMin: $tempMin, ')
          ..write('tempMax: $tempMax, ')
          ..write('hardnessMin: $hardnessMin, ')
          ..write('hardnessMax: $hardnessMax, ')
          ..write('careLevel: $careLevel, ')
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
                      aggressiveness.hashCode,
                      $mrjc(
                          phMin.hashCode,
                          $mrjc(
                              phMax.hashCode,
                              $mrjc(
                                  tempMin.hashCode,
                                  $mrjc(
                                      tempMax.hashCode,
                                      $mrjc(
                                          hardnessMin.hashCode,
                                          $mrjc(
                                              hardnessMax.hashCode,
                                              $mrjc(
                                                  careLevel.hashCode,
                                                  $mrjc(
                                                      percentFilled.hashCode,
                                                      $mrjc(
                                                          recommendationList
                                                              .hashCode,
                                                          $mrjc(
                                                              fishList.hashCode,
                                                              $mrjc(
                                                                  fishJson
                                                                      .hashCode,
                                                                  numFish
                                                                      .hashCode)))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Tank &&
          other.id == this.id &&
          other.name == this.name &&
          other.gallons == this.gallons &&
          other.status == this.status &&
          other.aggressiveness == this.aggressiveness &&
          other.phMin == this.phMin &&
          other.phMax == this.phMax &&
          other.tempMin == this.tempMin &&
          other.tempMax == this.tempMax &&
          other.hardnessMin == this.hardnessMin &&
          other.hardnessMax == this.hardnessMax &&
          other.careLevel == this.careLevel &&
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
  final Value<String> aggressiveness;
  final Value<double> phMin;
  final Value<double> phMax;
  final Value<int> tempMin;
  final Value<int> tempMax;
  final Value<int> hardnessMin;
  final Value<int> hardnessMax;
  final Value<String> careLevel;
  final Value<int> percentFilled;
  final Value<String> recommendationList;
  final Value<String> fishList;
  final Value<String> fishJson;
  final Value<int> numFish;
  const TanksCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.gallons = const Value.absent(),
    this.status = const Value.absent(),
    this.aggressiveness = const Value.absent(),
    this.phMin = const Value.absent(),
    this.phMax = const Value.absent(),
    this.tempMin = const Value.absent(),
    this.tempMax = const Value.absent(),
    this.hardnessMin = const Value.absent(),
    this.hardnessMax = const Value.absent(),
    this.careLevel = const Value.absent(),
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
    @required String aggressiveness,
    @required double phMin,
    @required double phMax,
    @required int tempMin,
    @required int tempMax,
    @required int hardnessMin,
    @required int hardnessMax,
    @required String careLevel,
    @required int percentFilled,
    @required String recommendationList,
    @required String fishList,
    @required String fishJson,
    @required int numFish,
  })  : name = Value(name),
        gallons = Value(gallons),
        status = Value(status),
        aggressiveness = Value(aggressiveness),
        phMin = Value(phMin),
        phMax = Value(phMax),
        tempMin = Value(tempMin),
        tempMax = Value(tempMax),
        hardnessMin = Value(hardnessMin),
        hardnessMax = Value(hardnessMax),
        careLevel = Value(careLevel),
        percentFilled = Value(percentFilled),
        recommendationList = Value(recommendationList),
        fishList = Value(fishList),
        fishJson = Value(fishJson),
        numFish = Value(numFish);
  TanksCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<int> gallons,
      Value<String> status,
      Value<String> aggressiveness,
      Value<double> phMin,
      Value<double> phMax,
      Value<int> tempMin,
      Value<int> tempMax,
      Value<int> hardnessMin,
      Value<int> hardnessMax,
      Value<String> careLevel,
      Value<int> percentFilled,
      Value<String> recommendationList,
      Value<String> fishList,
      Value<String> fishJson,
      Value<int> numFish}) {
    return TanksCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      gallons: gallons ?? this.gallons,
      status: status ?? this.status,
      aggressiveness: aggressiveness ?? this.aggressiveness,
      phMin: phMin ?? this.phMin,
      phMax: phMax ?? this.phMax,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      hardnessMin: hardnessMin ?? this.hardnessMin,
      hardnessMax: hardnessMax ?? this.hardnessMax,
      careLevel: careLevel ?? this.careLevel,
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

  final VerificationMeta _aggressivenessMeta =
      const VerificationMeta('aggressiveness');
  GeneratedTextColumn _aggressiveness;
  @override
  GeneratedTextColumn get aggressiveness =>
      _aggressiveness ??= _constructAggressiveness();
  GeneratedTextColumn _constructAggressiveness() {
    return GeneratedTextColumn('aggressiveness', $tableName, false,
        minTextLength: 0, maxTextLength: 50);
  }

  final VerificationMeta _phMinMeta = const VerificationMeta('phMin');
  GeneratedRealColumn _phMin;
  @override
  GeneratedRealColumn get phMin => _phMin ??= _constructPhMin();
  GeneratedRealColumn _constructPhMin() {
    return GeneratedRealColumn(
      'ph_min',
      $tableName,
      false,
    );
  }

  final VerificationMeta _phMaxMeta = const VerificationMeta('phMax');
  GeneratedRealColumn _phMax;
  @override
  GeneratedRealColumn get phMax => _phMax ??= _constructPhMax();
  GeneratedRealColumn _constructPhMax() {
    return GeneratedRealColumn(
      'ph_max',
      $tableName,
      false,
    );
  }

  final VerificationMeta _tempMinMeta = const VerificationMeta('tempMin');
  GeneratedIntColumn _tempMin;
  @override
  GeneratedIntColumn get tempMin => _tempMin ??= _constructTempMin();
  GeneratedIntColumn _constructTempMin() {
    return GeneratedIntColumn(
      'temp_min',
      $tableName,
      false,
    );
  }

  final VerificationMeta _tempMaxMeta = const VerificationMeta('tempMax');
  GeneratedIntColumn _tempMax;
  @override
  GeneratedIntColumn get tempMax => _tempMax ??= _constructTempMax();
  GeneratedIntColumn _constructTempMax() {
    return GeneratedIntColumn(
      'temp_max',
      $tableName,
      false,
    );
  }

  final VerificationMeta _hardnessMinMeta =
      const VerificationMeta('hardnessMin');
  GeneratedIntColumn _hardnessMin;
  @override
  GeneratedIntColumn get hardnessMin =>
      _hardnessMin ??= _constructHardnessMin();
  GeneratedIntColumn _constructHardnessMin() {
    return GeneratedIntColumn(
      'hardness_min',
      $tableName,
      false,
    );
  }

  final VerificationMeta _hardnessMaxMeta =
      const VerificationMeta('hardnessMax');
  GeneratedIntColumn _hardnessMax;
  @override
  GeneratedIntColumn get hardnessMax =>
      _hardnessMax ??= _constructHardnessMax();
  GeneratedIntColumn _constructHardnessMax() {
    return GeneratedIntColumn(
      'hardness_max',
      $tableName,
      false,
    );
  }

  final VerificationMeta _careLevelMeta = const VerificationMeta('careLevel');
  GeneratedTextColumn _careLevel;
  @override
  GeneratedTextColumn get careLevel => _careLevel ??= _constructCareLevel();
  GeneratedTextColumn _constructCareLevel() {
    return GeneratedTextColumn('care_level', $tableName, false,
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
    return GeneratedTextColumn('recommendation_list', $tableName, false,
        minTextLength: 0, maxTextLength: 5000);
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
    return GeneratedTextColumn('fish_json', $tableName, false,
        minTextLength: 0, maxTextLength: 5000);
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
        aggressiveness,
        phMin,
        phMax,
        tempMin,
        tempMax,
        hardnessMin,
        hardnessMax,
        careLevel,
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
    if (d.aggressiveness.present) {
      context.handle(
          _aggressivenessMeta,
          aggressiveness.isAcceptableValue(
              d.aggressiveness.value, _aggressivenessMeta));
    } else if (isInserting) {
      context.missing(_aggressivenessMeta);
    }
    if (d.phMin.present) {
      context.handle(
          _phMinMeta, phMin.isAcceptableValue(d.phMin.value, _phMinMeta));
    } else if (isInserting) {
      context.missing(_phMinMeta);
    }
    if (d.phMax.present) {
      context.handle(
          _phMaxMeta, phMax.isAcceptableValue(d.phMax.value, _phMaxMeta));
    } else if (isInserting) {
      context.missing(_phMaxMeta);
    }
    if (d.tempMin.present) {
      context.handle(_tempMinMeta,
          tempMin.isAcceptableValue(d.tempMin.value, _tempMinMeta));
    } else if (isInserting) {
      context.missing(_tempMinMeta);
    }
    if (d.tempMax.present) {
      context.handle(_tempMaxMeta,
          tempMax.isAcceptableValue(d.tempMax.value, _tempMaxMeta));
    } else if (isInserting) {
      context.missing(_tempMaxMeta);
    }
    if (d.hardnessMin.present) {
      context.handle(_hardnessMinMeta,
          hardnessMin.isAcceptableValue(d.hardnessMin.value, _hardnessMinMeta));
    } else if (isInserting) {
      context.missing(_hardnessMinMeta);
    }
    if (d.hardnessMax.present) {
      context.handle(_hardnessMaxMeta,
          hardnessMax.isAcceptableValue(d.hardnessMax.value, _hardnessMaxMeta));
    } else if (isInserting) {
      context.missing(_hardnessMaxMeta);
    }
    if (d.careLevel.present) {
      context.handle(_careLevelMeta,
          careLevel.isAcceptableValue(d.careLevel.value, _careLevelMeta));
    } else if (isInserting) {
      context.missing(_careLevelMeta);
    }
    if (d.percentFilled.present) {
      context.handle(
          _percentFilledMeta,
          percentFilled.isAcceptableValue(
              d.percentFilled.value, _percentFilledMeta));
    } else if (isInserting) {
      context.missing(_percentFilledMeta);
    }
    if (d.recommendationList.present) {
      context.handle(
          _recommendationListMeta,
          recommendationList.isAcceptableValue(
              d.recommendationList.value, _recommendationListMeta));
    } else if (isInserting) {
      context.missing(_recommendationListMeta);
    }
    if (d.fishList.present) {
      context.handle(_fishListMeta,
          fishList.isAcceptableValue(d.fishList.value, _fishListMeta));
    } else if (isInserting) {
      context.missing(_fishListMeta);
    }
    if (d.fishJson.present) {
      context.handle(_fishJsonMeta,
          fishJson.isAcceptableValue(d.fishJson.value, _fishJsonMeta));
    } else if (isInserting) {
      context.missing(_fishJsonMeta);
    }
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
    if (d.aggressiveness.present) {
      map['aggressiveness'] =
          Variable<String, StringType>(d.aggressiveness.value);
    }
    if (d.phMin.present) {
      map['ph_min'] = Variable<double, RealType>(d.phMin.value);
    }
    if (d.phMax.present) {
      map['ph_max'] = Variable<double, RealType>(d.phMax.value);
    }
    if (d.tempMin.present) {
      map['temp_min'] = Variable<int, IntType>(d.tempMin.value);
    }
    if (d.tempMax.present) {
      map['temp_max'] = Variable<int, IntType>(d.tempMax.value);
    }
    if (d.hardnessMin.present) {
      map['hardness_min'] = Variable<int, IntType>(d.hardnessMin.value);
    }
    if (d.hardnessMax.present) {
      map['hardness_max'] = Variable<int, IntType>(d.hardnessMax.value);
    }
    if (d.careLevel.present) {
      map['care_level'] = Variable<String, StringType>(d.careLevel.value);
    }
    if (d.percentFilled.present) {
      map['percent_filled'] = Variable<int, IntType>(d.percentFilled.value);
    }
    if (d.recommendationList.present) {
      map['recommendation_list'] =
          Variable<String, StringType>(d.recommendationList.value);
    }
    if (d.fishList.present) {
      map['fish_list'] = Variable<String, StringType>(d.fishList.value);
    }
    if (d.fishJson.present) {
      map['fish_json'] = Variable<String, StringType>(d.fishJson.value);
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
