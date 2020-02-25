import 'package:flutter_test/flutter_test.dart';
import 'package:tank_mates/models/tank.dart';
import 'package:tank_mates/util/tank_validator.dart';

void main() {
  testIsValidTemperature();
}

void testIsValidTemperature() {
  final Tank validTank = Tank();
  validTank.tempMin = 75;
  validTank.tempMax = 85;

  final Tank invalidTank = Tank();
  invalidTank.tempMin = 75;
  invalidTank.tempMax = 65;

  test('isValidTank returns true for a new Tank object', () {
    //setup of test case
    final TankValidator tankValidator = TankValidator(Tank());

    //expectation
    expect(tankValidator.isValidTemperature(), true);
  });

  test('isValidTank returns true for a Tank with a tempMin lower than tempMax',
      () {
    //setup of test case
    final TankValidator tankValidator = TankValidator(validTank);

    //expectation
    expect(tankValidator.isValidTemperature(), true);
  });

  test(
      'isValidTank returns false for a Tank with a tempMin greater than tempMax',
      () {
    //setup of test case
    final TankValidator tankValidator = TankValidator(invalidTank);

    //expectation
    expect(tankValidator.isValidTemperature(), false);
  });
}
