//import 'package:sqflite/sqflite.dart';
//import 'package:tank_mates/models/tank.dart';
//
//final String tableTank = 'tank';
//final String columnId = '_id';
//final String columnTitle = 'title';
//final String columnDone = 'done';
//
//class TankDbHelper {
//  Database db;
//
//  Future open(String path) async {
//    db = await openDatabase(path, version: 1,
//        onCreate: (Database db, int version) async {
//      await db.execute('''
//create table $tableTank (
//  $columnId integer primary key autoincrement,
//  $columnTitle text not null,
//  $columnDone integer not null)
//''');
//    });
//  }
//
//  Future<Tank> insert(Tank tank) async {
//    tank.id = await db.insert(tableTank, tank.toMap());
//    return tank;
//  }
//
//  Future<Tank> getTank(int id) async {
//    List<Map> maps = await db.query(tableTank,
//        columns: [columnId, columnDone, columnTitle],
//        where: '$columnId = ?',
//        whereArgs: [id]);
//    if (maps.length > 0) {
//      return Tank.fromMap(maps.first);
//    }
//    return null;
//  }
//
//  Future<int> delete(int id) async {
//    return await db.delete(tableTank, where: '$columnId = ?', whereArgs: [id]);
//  }
//
//  Future<int> update(Tank tank) async {
//    return await db.update(tableTank, tank.toMap(),
//        where: '$columnId = ?', whereArgs: [tank.id]);
//  }
//
//  Future close() async => db.close();
//}
