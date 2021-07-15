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
      print('Inserted tank ID: $id');
      return Tank(id, tank.name, tank.gallons, tank.species);
    } else {
      // Update existing tank
      box.put(record.id, record);
      print('Updated tank ID: ${record.id}');
      return tank;
    }
  }

  Future<Tank> getTank(int id) async {
    final box = await Hive.openBox(kTankTableKey);
    return box.getAt(id);
  }

  Future<List<Tank>> getAllTanks(List<Species> availableSpecies) async {
    final box = await Hive.openBox(kTankTableKey);
    List<Tank> tankList = [];

    box.toMap().forEach((key, record) {
      tankList.add(toModel(key, record, availableSpecies));
    });

    return tankList;
  }

  void deleteTank(int id) async {
    print('Deleting tank ID: $id');
    final box = await Hive.openBox(kTankTableKey);
    box.delete(id);
  }

  static Tank toModel(
      int id, TankRecord record, List<Species> availableSpecies) {
    final speciesList = record.speciesKeys
        .map((key) =>
            availableSpecies.firstWhere((species) => species.key == key))
        .toList();

    print('toModel tank ID: ${id}');

    return Tank(id, record.name, record.gallons, speciesList);
  }

  static TankRecord toRecord(Tank model) {
    List<String> speciesKeys =
        model.species.map((species) => species.key).toList();

    print('toModel tank ID: ${model.id}');

    return TankRecord(model.id, model.name, model.gallons, speciesKeys);
  }
}
