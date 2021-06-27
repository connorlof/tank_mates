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
  final String status;

  @HiveField(3)
  final int percentFilled;

  @HiveField(4)
  final List<String> recommendations;

  @HiveField(5)
  final List<String> species;

  TankRecord(this.name, this.gallons, this.status, this.percentFilled,
      this.recommendations, this.species);

  Tank toModel() {
    return Tank(0, this.name, this.gallons, this.status, this.percentFilled,
        this.recommendations, this.species);
  }

  static TankRecord toRecord(Tank model) {
    return TankRecord(model.name, model.gallons, model.status,
        model.percentFilled, model.recommendations, model.species);
  }
}
