import 'package:tank_mates/data/model/active_tank.dart';

class TankValidator {
  bool isValidTank(ActiveTank tank) {
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

  bool isValidTemperature(ActiveTank tank) {
    if (tank.tempMin <= tank.tempMax) {
      return true;
    }

    return false;
  }

  bool isValidPh(ActiveTank tank) {
    if (tank.phMin <= tank.phMax) {
      return true;
    }

    return false;
  }

  bool isValidHardness(ActiveTank tank) {
    if (tank.hardnessMin <= tank.hardnessMax) {
      return true;
    }

    return false;
  }
}
