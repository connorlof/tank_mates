import 'package:tank_mates/models/tank.dart';

class TankValidator {
  bool isValidTank(Tank tank) {
    if (!isValidTemperature(tank)) {
      return false;
    }

    if (!isValidPh(tank)) {
      return false;
    }

    if (!isValidHardness(tank)) {
      return false;
    }

    return true;
  }

  bool isValidTemperature(Tank tank) {
    if (tank.tempMin <= tank.tempMax) {
      return true;
    }

    return false;
  }

  bool isValidPh(Tank tank) {
    if (tank.phMin <= tank.phMax) {
      return true;
    }

    return false;
  }

  bool isValidHardness(Tank tank) {
    if (tank.hardnessMin <= tank.hardnessMax) {
      return true;
    }

    return false;
  }
}
