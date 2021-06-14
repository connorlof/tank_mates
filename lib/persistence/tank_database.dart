import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'list_column_converter.dart';

part 'tank_database.g.dart';

class Tanks extends Table {
  // autoIncrement automatically sets this to be the primary key
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 0, max: 50)();
  IntColumn get gallons => integer()();
  TextColumn get status => text().withLength(min: 0, max: 50)();
  IntColumn get percentFilled => integer()();

  TextColumn get recommendationList =>
      text().map(const ListColumnConverter()).nullable()();
  TextColumn get fishList => text().withLength(min: 0, max: 5000)();
  TextColumn get fishJson =>
      text().map(const ListColumnConverter()).nullable()();
  IntColumn get numFish => integer()();
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
  Future insertTank(TanksCompanion tank) => into(tanks).insert(tank);
  Future updateTank(Tank tank) => update(tanks).replace(tank);
  Future deleteTank(Tank tank) => delete(tanks).delete(tank);
}
