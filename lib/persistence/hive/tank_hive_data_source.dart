import 'package:hive/hive.dart';
import 'package:tank_mates/models/tank.dart';
import 'package:tank_mates/persistence/hive/TankRecord.dart';

class TankHiveDataSource {
  Box _box = Hive.box('tanks');

  Future insertOrUpdate(Tank tank) {
    return _box.add(TankRecord.toRecord(tank));
  }

  Future delete(Tank tank) {
    return _box.delete(tank.id);
  }

  List<Tank> getAll() {
    return _box.toMap().values.toList();
  }
}
