import 'package:tank_mates/data/model/tank_state.dart';

class TankValidator {
  bool isValidTank(TankState tank) {
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

  bool isValidTemperature(TankState tank) {
    if (tank.tempMin <= tank.tempMax) {
      return true;
    }

    return false;
  }

  bool isValidPh(TankState tank) {
    if (tank.phMin <= tank.phMax) {
      return true;
    }

    return false;
  }

  bool isValidHardness(TankState tank) {
    if (tank.hardnessMin <= tank.hardnessMax) {
      return true;
    }

    return false;
  }
}
