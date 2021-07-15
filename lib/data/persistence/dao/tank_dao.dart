import 'package:hive/hive.dart';
import 'package:tank_mates/data/model/species.dart';
import 'package:tank_mates/data/model/tank.dart';
import 'package:tank_mates/data/persistence/hive/TankRecord.dart';
import 'package:tank_mates/data/persistence/hive/hive_constants.dart';

class TankDao {
  Future<Tank> updateOrInsert(Tank tank) async {
    final box = await Hive.openBox(kTankTableKey);
    final record = toRecord(tank);

    if (record.id == kDefaultTankId) {
      // Insert new tank
      final int id = await box.add(record);
      return Tank(id, tank.name, tank.gallons, tank.species);
    } else {
      // Update existing tank
      box.putAt(record.id, record);
      return tank;
    }
  }

  Future<Tank> getTank(int id) async {
    final box = await Hive.openBox(kTankTableKey);
    return box.getAt(id);
  }

  Future<List<Tank>> getAllTanks(List<Species> availableSpecies) async {
    final box = await Hive.openBox(kTankTableKey);
    return box.values
        .map((record) => toModel(record, availableSpecies))
        .toList();
  }

  void deleteTank(int id) async {
    final box = await Hive.openBox(kTankTableKey);
    box.deleteAt(id);
  }

  static Tank toModel(TankRecord record, List<Species> availableSpecies) {
    final speciesList = record.speciesKeys
        .map((key) =>
            availableSpecies.firstWhere((species) => species.key == key))
        .toList();

    return Tank(record.id, record.name, record.gallons, speciesList);
  }

  static TankRecord toRecord(Tank model) {
    List<String> speciesKeys =
        model.species.map((species) => species.key).toList();

    return TankRecord(model.id, model.name, model.gallons, speciesKeys);
  }
}
