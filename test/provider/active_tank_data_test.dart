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

    expect(tankData.addedFish.length, 0);
    expect(tankData.tank.aggressiveness, Aggressiveness.peaceful);

    //add fish
    tankData.addFish(fish1);

    expect(tankData.addedFish.length, 1);
    expect(tankData.tank.aggressiveness, Aggressiveness.aggressive);
  });
}
