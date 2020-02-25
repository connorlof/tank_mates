import 'package:tank_mates/models/tank.dart';

class TankValidator {
  Tank tank;

  TankValidator(this.tank);

  bool isValidTemperature() {
    int min = tank.tempMin;
    int max = tank.tempMax;

    if (min <= max) {
      return true;
    }

    return false;
  }
}
