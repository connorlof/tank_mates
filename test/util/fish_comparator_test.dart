import 'package:flutter_test/flutter_test.dart';
import 'package:tank_mates/models/fish.dart';
import 'package:tank_mates/util/fish_comparator.dart';

void main() {
  testDetermineAggressiveness();
  testDetermineCareLevel();
  testDetermineMinTankSize();
  testDetermineStockingPercent();
  testDetermineMinTemp();
  testDetermineMaxTemp();
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
    final List<Fish> fishList = [
      peacefulFish,
      peacefulFish,
      peacefulFish,
      peacefulFish
    ];

    Aggressiveness determinedAggressiveness =
        FishComparator.determineAggressiveness(fishList);

    //expectation
    expect(determinedAggressiveness, Aggressiveness.peaceful);
  });

  test(
      'determineAggressiveness returns moderate if peaceful and moderate are in list',
      () {
    //setup of test case
    final List<Fish> fishList = [
      peacefulFish,
      moderateFish,
      peacefulFish,
      peacefulFish
    ];

    Aggressiveness determinedAggressiveness =
        FishComparator.determineAggressiveness(fishList);

    //expectation
    expect(determinedAggressiveness, Aggressiveness.moderate);
  });

  test(
      'determineAggressiveness returns semi_aggressive if peaceful, moderate, and semi-aggressive are in list',
      () {
    //setup of test case
    final List<Fish> fishList = [
      peacefulFish,
      moderateFish,
      semiAggressiveFish,
      peacefulFish
    ];

    Aggressiveness determinedAggressiveness =
        FishComparator.determineAggressiveness(fishList);

    //expectation
    expect(determinedAggressiveness, Aggressiveness.semi_aggressive);
  });

  test('determineAggressiveness returns aggressive if aggressive is in list',
      () {
    //setup of test case
    final List<Fish> fishList = [
      peacefulFish,
      moderateFish,
      semiAggressiveFish,
      aggressiveFish
    ];

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
    final List<Fish> fishList = [easyFish, easyFish, easyFish, easyFish];

    CareLevel determinedCareLevel = FishComparator.determineCareLevel(fishList);

    //expectation
    expect(determinedCareLevel, CareLevel.easy);
  });

  test('determineCareLevel returns moderate if easy and moderate are in list',
      () {
    //setup of test case
    final List<Fish> fishList = [easyFish, moderateFish, easyFish, easyFish];

    CareLevel determinedCareLevel = FishComparator.determineCareLevel(fishList);

    //expectation
    expect(determinedCareLevel, CareLevel.moderate);
  });

  test(
      'determineCareLevel returns difficult if easy, moderate, and difficult are in list',
      () {
    //setup of test case
    final List<Fish> fishList = [
      easyFish,
      moderateFish,
      difficultFish,
      easyFish
    ];

    CareLevel determinedCareLevel = FishComparator.determineCareLevel(fishList);

    //expectation
    expect(determinedCareLevel, CareLevel.difficult);
  });

  test('determineCareLevel returns expert if expert is in list', () {
    //setup of test case
    final List<Fish> fishList = [
      easyFish,
      moderateFish,
      difficultFish,
      expertFish
    ];

    CareLevel determinedCareLevel = FishComparator.determineCareLevel(fishList);

    //expectation
    expect(determinedCareLevel, CareLevel.expert);
  });
}

void testDetermineMinTankSize() {
  final Fish fishSize1 = Fish();
  fishSize1.minTankSize = 1;

  final Fish fishSize2 = Fish();
  fishSize2.minTankSize = 2;

  test('determineMinTankSize returns 0 for empty list', () {
    //setup of test case
    final List<Fish> fishList = [];

    int minTankSize = FishComparator.determineMinTankSize(fishList);

    //expectation
    expect(minTankSize, 0);
  });

  test(
      'determineMinTankSize returns minTankSize of single fish in list only containing that fish',
      () {
    //setup of test case
    final List<Fish> fishList = [fishSize1];

    int minTankSize = FishComparator.determineMinTankSize(fishList);

    //expectation
    expect(minTankSize, fishSize1.minTankSize);
  });

  test(
      'determineMinTankSize returns minTankSize of fish with largest minTankSize in list of differing fish',
      () {
    //setup of test case
    final List<Fish> fishList = [fishSize1, fishSize2];

    int minTankSize = FishComparator.determineMinTankSize(fishList);

    //expectation
    expect(minTankSize, fishSize2.minTankSize);
  });
}

void testDetermineStockingPercent() {
  final Fish fishSize1 = Fish();
  fishSize1.maximumaAdultSize = 1;

  test(
      'determineStocking returns 0 (int) when passed an empty list and 0 gallons',
      () {
    //setup of test case
    final List<Fish> fishList = [];
    final int gallons = 0;

    int stockingPercent =
        FishComparator.determineStockingPercent(fishList, gallons);

    //expectation
    expect(stockingPercent, 0);
  });

  test(
      'determineStockingPercent returns 100 when passed a single fish of equal inches to gallons',
      () {
    //setup of test case
    final List<Fish> fishList = [fishSize1];
    final int gallons = fishSize1.maximumaAdultSize.toInt();

    int stockingPercent =
        FishComparator.determineStockingPercent(fishList, gallons);

    //expectation
    expect(stockingPercent, 100);
  });

  test(
      'determineStockingPercent returns 50 when passed a single fish of double gallons to max size',
      () {
    //setup of test case
    final List<Fish> fishList = [fishSize1];
    final int gallons = fishSize1.maximumaAdultSize.toInt() * 2;

    int stockingPercent =
        FishComparator.determineStockingPercent(fishList, gallons);

    //expectation
    expect(stockingPercent, 50);
  });

  test(
      'determineStockingPercent returns 200 when passed a two fish of half gallons to total max size',
      () {
    //setup of test case
    final List<Fish> fishList = [fishSize1, fishSize1];
    final int gallons = fishSize1.maximumaAdultSize.toInt();

    int stockingPercent =
        FishComparator.determineStockingPercent(fishList, gallons);

    //expectation
    expect(stockingPercent, 200);
  });

  test('determineStockingPercent returns 999 when passed a fish and 0 gallons',
      () {
    //setup of test case
    final List<Fish> fishList = [fishSize1];
    final int gallons = 0;

    int stockingPercent =
        FishComparator.determineStockingPercent(fishList, gallons);

    //expectation
    expect(stockingPercent, 999);
  });
}

void testDetermineMinTemp() {
  final Fish fish1 = Fish();
  fish1.tempMin = 70;
  fish1.tempMax = 80;

  final Fish fish2 = Fish();
  fish2.tempMin = 65;
  fish2.tempMax = 80;

  final Fish fish3 = Fish();
  fish3.tempMin = 40;
  fish3.tempMax = 80;

  test('determineMinTemp returns 0 (int) when passed an empty fish list', () {
    //setup of test case
    final List<Fish> fishList = [];

    int minTemp = FishComparator.determineMinTemp(fishList);

    //expectation
    expect(minTemp, 0);
  });

  test(
      'determineMinTemp returns the tempMin of a Fish if it is the only one in a list',
      () {
    //setup of test case
    final List<Fish> fishList = [fish1];

    int minTemp = FishComparator.determineMinTemp(fishList);

    //expectation
    expect(minTemp, fish1.tempMin);
  });

  test(
      'determineMinTemp returns the highest tempMin of three fish with different tempMins',
      () {
    //setup of test case
    final List<Fish> fishList = [fish1, fish2, fish3];

    int minTemp = FishComparator.determineMinTemp(fishList);

    //expectation
    expect(minTemp, fish1.tempMin);
  });
}

void testDetermineMaxTemp() {
  final Fish fish1 = Fish();
  fish1.tempMin = 50;
  fish1.tempMax = 60;

  final Fish fish2 = Fish();
  fish2.tempMin = 65;
  fish2.tempMax = 70;

  final Fish fish3 = Fish();
  fish3.tempMin = 40;
  fish3.tempMax = 80;

  test('determineMaxTemp returns 100 (int) when passed an empty fish list', () {
    //setup of test case
    final List<Fish> fishList = [];

    int maxTemp = FishComparator.determineMaxTemp(fishList);

    //expectation
    expect(maxTemp, 100);
  });

  test(
      'determineMaxTemp returns the tempMax of a Fish if it is the only one in a list',
      () {
    //setup of test case
    final List<Fish> fishList = [fish1];

    int maxTemp = FishComparator.determineMaxTemp(fishList);

    //expectation
    expect(maxTemp, fish1.tempMax);
  });

  test(
      'determineMaxTemp returns the smallest tempMax of three fish with different tempMaxes',
      () {
    //setup of test case
    final List<Fish> fishList = [fish1, fish2, fish3];

    int maxTemp = FishComparator.determineMaxTemp(fishList);

    //expectation
    expect(maxTemp, fish1.tempMax);
  });
}
