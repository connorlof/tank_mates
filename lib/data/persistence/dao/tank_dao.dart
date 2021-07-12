import 'package:hive/hive.dart';
import 'package:tank_mates/data/model/tank.dart';
import 'package:tank_mates/data/persistence/hive/TankRecord.dart';
import 'package:tank_mates/data/persistence/hive/hive_constants.dart';

class TankDao {
  Future<Tank> updateOrInsert(Tank tank) async {
    final box = await Hive.openBox(kTankTableKey);

    if (tank.id == kDefaultTankId) {
      // Insert new tank
      final int id = await box.add(tank);
      return Tank(id, tank.name, tank.gallons, tank.species);
    } else {
      // Update existing tank
      box.putAt(tank.id, tank);
      return tank;
    }
  }

  Future<Tank> getTank(int id) async {
    final box = await Hive.openBox(kTankTableKey);
    return box.getAt(id);
  }

  Future<List<Tank>> getAllTanks() async {
    final box = await Hive.openBox(kTankTableKey);
    return box.values.toList();
  }

  void deleteTank(int id) async {
    final box = await Hive.openBox(kTankTableKey);
    box.deleteAt(id);
  }

  // Load species (call into Species DAO)
  // TODO: Perhaps belongs in the ViewModel for now (or repository)

  static Tank toModel(TankRecord record) {
    // TODO: Convert to species (this should be in DAO, not here)
    return Tank(record.id, record.name, record.gallons, []);
  }

  static TankRecord toRecord(Tank model) {
    List<String> speciesKeys = model.species.map((species) => species.key);

    return TankRecord(model.id, model.name, model.gallons, speciesKeys);
  }
}
