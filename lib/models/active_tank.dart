import 'package:tank_mates/models/fish.dart';

class ActiveTank {
  String tankName = "Tank Name";
  int gallons = 20;
  TankStatus status = TankStatus.Good;

  Aggressiveness aggressiveness = Aggressiveness.peaceful;
  double phMin = 0.0;
  double phMax = 14.0;
  int tempMin = 0;
  int tempMax = 100;
  int hardnessMin = 0;
  int hardnessMax = 100;
  CareLevel careLevel = CareLevel.easy;
  int percentFilled = 0;

  List<String> recommendationList = ['Add some fish to your tank!'];
}

enum TankStatus { Good, Warning, Incompatible, Overstocked }
