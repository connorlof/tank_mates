import 'package:flutter_test/flutter_test.dart';
import 'package:tank_mates/models/fish.dart';
import 'package:tank_mates/util/fish_comparator.dart';

void main() {
  testDetermineAggressiveness();
  testDetermineCareLevel();
}

void testDetermineAggressiveness() {
  final Fish peacefulFish = Fish();
  peacefulFish.aggressiveness = Aggressiveness.peaceful;

  final Fish moderateFish = Fish();
  moderateFish.aggressiveness = Aggressiveness.moderate;

  final Fish semiAggressiveFish = Fish();
  semiAggressiveFish.aggressiveness = Aggressiveness.semi_aggressive;

  final Fish aggressiveFish = Fish();
  aggressiveFish.aggressiveness = Aggressiveness.aggressive;

  test('determineAggressiveness returns peaceful for empty list', () {
    //setup of test case
    final List<Fish> fishList = [];

    Aggressiveness foundAggressiveness =
        FishComparator.determineAggressiveness(fishList);

    //expectation
    expect(foundAggressiveness, Aggressiveness.peaceful);
  });

  test(
      'determineAggressiveness returns peaceful if only peaceful fish are in list',
      () {
    //setup of test case
    final List<Fish> fishList = [];
    fishList.add(peacefulFish);
    fishList.add(peacefulFish);
    fishList.add(peacefulFish);
    fishList.add(peacefulFish);

    Aggressiveness determinedAggressiveness =
        FishComparator.determineAggressiveness(fishList);

    //expectation
    expect(determinedAggressiveness, Aggressiveness.peaceful);
  });

  test(
      'determineAggressiveness returns moderate if peaceful and moderate are in list',
      () {
    //setup of test case
    final List<Fish> fishList = [];
    fishList.add(peacefulFish);
    fishList.add(moderateFish);
    fishList.add(peacefulFish);
    fishList.add(peacefulFish);

    Aggressiveness determinedAggressiveness =
        FishComparator.determineAggressiveness(fishList);

    //expectation
    expect(determinedAggressiveness, Aggressiveness.moderate);
  });

  test(
      'determineAggressiveness returns semi_aggressive if peaceful, moderate, and semi-aggressive are in list',
      () {
    //setup of test case
    final List<Fish> fishList = [];
    fishList.add(peacefulFish);
    fishList.add(moderateFish);
    fishList.add(semiAggressiveFish);
    fishList.add(peacefulFish);

    Aggressiveness determinedAggressiveness =
        FishComparator.determineAggressiveness(fishList);

    //expectation
    expect(determinedAggressiveness, Aggressiveness.semi_aggressive);
  });

  test('determineAggressiveness returns aggressive if aggressive is in list',
      () {
    //setup of test case
    final List<Fish> fishList = [];
    fishList.add(peacefulFish);
    fishList.add(moderateFish);
    fishList.add(semiAggressiveFish);
    fishList.add(aggressiveFish);

    Aggressiveness determinedAggressiveness =
        FishComparator.determineAggressiveness(fishList);

    //expectation
    expect(determinedAggressiveness, Aggressiveness.aggressive);
  });
}

void testDetermineCareLevel() {
  final Fish easyFish = Fish();
  easyFish.careLevel = CareLevel.easy;

  final Fish moderateFish = Fish();
  moderateFish.careLevel = CareLevel.moderate;

  final Fish difficultFish = Fish();
  difficultFish.careLevel = CareLevel.difficult;

  final Fish expertFish = Fish();
  expertFish.careLevel = CareLevel.expert;

  test('determineCareLevel returns easy for empty list', () {
    //setup of test case
    final List<Fish> fishList = [];

    CareLevel determinedCareLevel = FishComparator.determineCareLevel(fishList);

    //expectation
    expect(determinedCareLevel, CareLevel.easy);
  });

  test('determineCareLevel returns easy if only easy fish are in list', () {
    //setup of test case
    final List<Fish> fishList = [];
    fishList.add(easyFish);
    fishList.add(easyFish);
    fishList.add(easyFish);
    fishList.add(easyFish);

    CareLevel determinedCareLevel = FishComparator.determineCareLevel(fishList);

    //expectation
    expect(determinedCareLevel, CareLevel.easy);
  });

  test('determineCareLevel returns moderate if easy and moderate are in list',
      () {
    //setup of test case
    final List<Fish> fishList = [];
    fishList.add(easyFish);
    fishList.add(moderateFish);
    fishList.add(easyFish);
    fishList.add(easyFish);

    CareLevel determinedCareLevel = FishComparator.determineCareLevel(fishList);

    //expectation
    expect(determinedCareLevel, CareLevel.moderate);
  });

  test(
      'determineCareLevel returns difficult if easy, moderate, and difficult are in list',
      () {
    //setup of test case
    final List<Fish> fishList = [];
    fishList.add(easyFish);
    fishList.add(moderateFish);
    fishList.add(difficultFish);
    fishList.add(easyFish);

    CareLevel determinedCareLevel = FishComparator.determineCareLevel(fishList);

    //expectation
    expect(determinedCareLevel, CareLevel.difficult);
  });

  test('determineCareLevel returns expert if expert is in list', () {
    //setup of test case
    final List<Fish> fishList = [];
    fishList.add(easyFish);
    fishList.add(moderateFish);
    fishList.add(difficultFish);
    fishList.add(expertFish);

    CareLevel determinedCareLevel = FishComparator.determineCareLevel(fishList);

    //expectation
    expect(determinedCareLevel, CareLevel.expert);
  });
}
