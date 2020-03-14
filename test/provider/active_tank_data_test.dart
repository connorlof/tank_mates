import 'package:flutter_test/flutter_test.dart';
import 'package:tank_mates/models/fish.dart';
import 'package:tank_mates/provider/active_tank_data.dart';

void main() {
  testAddFish();
}

void testAddFish() {
  final ActiveTankData tankData = ActiveTankData();
  final Fish fish1 = Fish();

  test(
      '_fish is empty after creation, 1 after adding a fish, _tank reflects aggressiveness level of fish',
      () {
    //setup of test case
    fish1.aggressiveness = Aggressiveness.aggressive;
    fish1.maximumaAdultSize = 5;
    fish1.name = 'example fish';
    fish1.scientificName = 'science example';
    fish1.speciesGroup = 'goldfish';
    fish1.phMin = 7.0;
    fish1.phMax = 8.0;
    fish1.tempMin = 70;
    fish1.tempMax = 80;
    fish1.hardnessMin = 10;
    fish1.hardnessMax = 20;
    fish1.careLevel = CareLevel.easy;
    fish1.diet = Diet.carnivore;
    fish1.minTankSize = 20;

    expect(tankData.addedFish.length, 0);
    expect(tankData.tank.aggressiveness, Aggressiveness.peaceful);

    //add fish
    tankData.addFish(fish1);

    expect(tankData.addedFish.length, 1);
    expect(tankData.tank.aggressiveness, Aggressiveness.aggressive);
  });
}
