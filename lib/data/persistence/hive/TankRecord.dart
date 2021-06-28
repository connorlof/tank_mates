import 'package:hive/hive.dart';
import 'package:tank_mates/data/model/tank.dart';

part 'TankRecord.g.dart';

@HiveType(typeId: 2)
class TankRecord {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int gallons;

  @HiveField(2)
  final List<String> species;

  TankRecord(this.name, this.gallons, this.species);

  Tank toModel() {
    // TODO: Convert to species (this should be in DAO, not here)
    return Tank(0, this.name, this.gallons, []);
  }

  static TankRecord toRecord(Tank model) {
    List<String> species =
        model.species.map((species) => species.scientificName);

    return TankRecord(model.name, model.gallons, species);
  }
}
