import 'package:tank_mates/models/fish.dart';

class Tank {
  TankStatus status = TankStatus.Good;

  String tankName = "Tank Name";
  int gallons = 100; //todo: set to proper value
  Aggressiveness aggressiveness = Aggressiveness.peaceful;
  double phMin = 0.0;
  double phMax = 14.0;
  int tempMin = 0;
  int tempMax = 100;
  int hardnessMin = 0;
  int hardnessMax = 100;
  CareLevel careLevel = CareLevel.easy;
  int percentFilled = 0;
}

enum TankStatus { Good, Warning, Incompatible, Overstocked }
