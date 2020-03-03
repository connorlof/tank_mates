import 'dart:io';

import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'tank_database.g.dart';

class Tanks extends Table {
  // autoIncrement automatically sets this to be the primary key
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 50)();
  IntColumn get gallons => integer()();
  TextColumn get status => text().withLength(min: 1, max: 50)();

  TextColumn get aggressiveness => text().withLength(min: 1, max: 50)();
  RealColumn get phMin => real()();
  RealColumn get phMax => real()();
  IntColumn get tempMin => integer()();
  IntColumn get tempMax => integer()();
  IntColumn get hardnessMin => integer()();
  IntColumn get hardnessMax => integer()();
  TextColumn get careLevel => text().withLength(min: 1, max: 50)();
  IntColumn get percentFilled => integer()();

  TextColumn get recommendationList => text().withLength(min: 1, max: 5000)();
  TextColumn get fishList => text().withLength(min: 1, max: 5000)();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Tanks])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Tank>> getAllTanks() => select(tanks).get();
  Stream<List<Tank>> watchAllTanks() => select(tanks).watch();
  Future insertTank(Tank tank) => into(tanks).insert(tank);
  Future updateTank(Tank tank) => update(tanks).replace(tank);
  Future deleteTank(Tank tank) => delete(tanks).delete(tank);
}
