import 'package:flutter_test/flutter_test.dart';
import 'package:tank_mates/models/active_tank.dart';
import 'package:tank_mates/util/tank_validator.dart';

void main() {
  testIsValidTemperature();
  testIsValidPh();
  testIsValidHardness();
}

void testIsValidTemperature() {
  final TankValidator tankValidator = TankValidator();

  final ActiveTank defaultTank = ActiveTank();

  final ActiveTank validTank = ActiveTank();
  validTank.tempMin = 75;
  validTank.tempMax = 85;

  final ActiveTank invalidTank = ActiveTank();
  invalidTank.tempMin = 75;
  invalidTank.tempMax = 65;

  test('isValidTemperature returns true for a new Tank object', () {
    //setup of test case
    bool isValid = tankValidator.isValidTemperature(defaultTank);

    //expectation
    expect(isValid, true);
  });

  test(
      'isValidTemperature returns true for a Tank with a tempMin lower than tempMax',
      () {
    //setup of test case
    bool isValid = tankValidator.isValidTemperature(validTank);

    //expectation
    expect(isValid, true);
  });

  test(
      'isValidTemperature returns false for a Tank with a tempMin greater than tempMax',
      () {
    //setup of test case
    bool isValid = tankValidator.isValidTemperature(invalidTank);

    //expectation
    expect(isValid, false);
  });
}

void testIsValidPh() {
  final TankValidator tankValidator = TankValidator();

  final ActiveTank defaultTank = ActiveTank();

  final ActiveTank validTank = ActiveTank();
  validTank.phMin = 6.0;
  validTank.phMax = 8.0;

  final ActiveTank invalidTank = ActiveTank();
  invalidTank.phMin = 8.0;
  invalidTank.phMax = 6.0;

  test('isValidPh returns true for a new Tank object', () {
    //setup of test case
    bool isValid = tankValidator.isValidPh(defaultTank);

    //expectation
    expect(isValid, true);
  });

  test('isValidPh returns true for a Tank with a phMin lower than phMax', () {
    //setup of test case
    bool isValid = tankValidator.isValidPh(validTank);

    //expectation
    expect(isValid, true);
  });

  test('isValidPh returns false for a Tank with a phMin greater than phMax',
      () {
    //setup of test case
    bool isValid = tankValidator.isValidPh(invalidTank);

    //expectation
    expect(isValid, false);
  });
}

void testIsValidHardness() {
  final TankValidator tankValidator = TankValidator();

  final ActiveTank defaultTank = ActiveTank();

  final ActiveTank validTank = ActiveTank();
  validTank.hardnessMin = 10;
  validTank.hardnessMax = 20;

  final ActiveTank invalidTank = ActiveTank();
  invalidTank.hardnessMin = 20;
  invalidTank.hardnessMax = 10;

  test('isValidHardness returns true for a new Tank object', () {
    //setup of test case
    bool isValid = tankValidator.isValidHardness(defaultTank);

    //expectation
    expect(isValid, true);
  });

  test(
      'isValidHardness returns true for a Tank with a hardnessMin lower than hardnessMax',
      () {
    //setup of test case
    bool isValid = tankValidator.isValidHardness(validTank);

    //expectation
    expect(isValid, true);
  });

  test(
      'isValidHardness returns false for a Tank with a hardnessMin greater than hardnessMax',
      () {
    //setup of test case
    bool isValid = tankValidator.isValidHardness(invalidTank);

    //expectation
    expect(isValid, false);
  });
}
