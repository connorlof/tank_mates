import 'package:flutter_test/flutter_test.dart';
import 'package:tank_mates/models/fish.dart';
import 'package:tank_mates/util/fish_comparator.dart';

void main() {
  test('determineAggressiveness returns peaceful for empty list', () {
    //setup of test case
    List<Fish> emptyFishList = [];
    Aggressiveness foundAggressiveness =
        FishComparator.determineAggressiveness(emptyFishList);

    //expectation
    expect(foundAggressiveness, Aggressiveness.peaceful);
  });
}
