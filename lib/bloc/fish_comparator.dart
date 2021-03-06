import 'package:tank_mates/data/model/species.dart';
import 'package:tank_mates/util/constants.dart';

class FishComparator {
  //String phRange = "6.9-7.1";
  //String temperatureRange = "75-86";
  //String hardness = "1-10";

  //String maximumAdultSize = "5";
  //String diet = "Carnivore";

  static Aggressiveness determineAggressiveness(List<Species> fishList) {
    Aggressiveness highestAggressiveness = Aggressiveness.peaceful;
    List<Aggressiveness> aggressionLevels = [];

    for (var fish in fishList) {
      if (fish.aggressiveness == Aggressiveness.moderate) {
        aggressionLevels.add(Aggressiveness.moderate);
      } else if (fish.aggressiveness == Aggressiveness.semi_aggressive) {
        aggressionLevels.add(Aggressiveness.semi_aggressive);
      } else if (fish.aggressiveness == Aggressiveness.aggressive) {
        aggressionLevels.add(Aggressiveness.aggressive);
      }
    }

    if (aggressionLevels.contains(Aggressiveness.aggressive)) {
      highestAggressiveness = Aggressiveness.aggressive;
    } else if (aggressionLevels.contains(Aggressiveness.semi_aggressive)) {
      highestAggressiveness = Aggressiveness.semi_aggressive;
    } else if (aggressionLevels.contains(Aggressiveness.moderate)) {
      highestAggressiveness = Aggressiveness.moderate;
    }

    return highestAggressiveness;
  }

  static CareLevel determineCareLevel(List<Species> fishList) {
    CareLevel highestCareLevel = CareLevel.easy;
    List<CareLevel> careLevels = [];

    for (var fish in fishList) {
      if (fish.careLevel == CareLevel.moderate) {
        careLevels.add(CareLevel.moderate);
      } else if (fish.careLevel == CareLevel.difficult) {
        careLevels.add(CareLevel.difficult);
      } else if (fish.careLevel == CareLevel.expert) {
        careLevels.add(CareLevel.expert);
      }
    }

    if (careLevels.contains(CareLevel.expert)) {
      highestCareLevel = CareLevel.expert;
    } else if (careLevels.contains(CareLevel.difficult)) {
      highestCareLevel = CareLevel.difficult;
    } else if (careLevels.contains(CareLevel.moderate)) {
      highestCareLevel = CareLevel.moderate;
    }

    return highestCareLevel;
  }

  static int determineMinTankSize(List<Species> fishList) {
    int greatestMinTank = 0;

    for (var fish in fishList) {
      if (fish.minTankSize > greatestMinTank) {
        greatestMinTank = fish.minTankSize;
      }
    }

    return greatestMinTank;
  }

  //TODO: determine better formula other than inch per gallon
  static int determineStockingPercent(List<Species> fishList, int tankGallons) {
    if (fishList.isEmpty) {
      return 0;
    }

    if (tankGallons == 0) {
      return 999;
    }

    double stockingPercent = 0.00;
    double totalInchesOfFish = 0.00;

    for (var fish in fishList) {
      print('totalInchesOfFish:' + totalInchesOfFish.toString());
      print('fish.maximumAdultSize:' + fish.maximumAdultSize.toString());

      totalInchesOfFish += fish.maximumAdultSize;
    }

    stockingPercent = totalInchesOfFish / tankGallons * 100;

    return stockingPercent.round();
  }

  static int determineMinTemp(List<Species> fishList) {
    int minTemp = 0;

    for (var fish in fishList) {
      if (minTemp < fish.tempMin) {
        minTemp = fish.tempMin;
      }
    }

    return minTemp;
  }

  static int determineMaxTemp(List<Species> fishList) {
    int maxTemp = 100;

    for (var fish in fishList) {
      if (maxTemp > fish.tempMax) {
        maxTemp = fish.tempMax;
      }
    }

    return maxTemp;
  }

  static double determineMinPh(List<Species> fishList) {
    double minPh = 0.0;

    for (var fish in fishList) {
      if (minPh < fish.phMin) {
        minPh = fish.phMin;
      }
    }

    return minPh;
  }

  static double determineMaxPh(List<Species> fishList) {
    double maxPh = 14.0;

    for (var fish in fishList) {
      if (maxPh > fish.phMax) {
        maxPh = fish.phMax;
      }
    }

    return maxPh;
  }

  static int determineMinHardness(List<Species> fishList) {
    int minHardness = 0;

    for (var fish in fishList) {
      if (minHardness < fish.hardnessMin) {
        minHardness = fish.hardnessMin;
      }
    }

    return minHardness;
  }

  static int determineMaxHardness(List<Species> fishList) {
    int maxHardness = 100;

    for (var fish in fishList) {
      if (maxHardness > fish.hardnessMax) {
        maxHardness = fish.hardnessMax;
      }
    }

    return maxHardness;
  }

  static String determineRecommendationFood(List<Species> fishList) {
    bool hasCarnivore = false;
    bool hasHerbivore = false;
    bool hasOmnivore = false;

    for (var fish in fishList) {
      if (fish.diet == Diet.carnivore) {
        hasCarnivore = true;
      } else if (fish.diet == Diet.herbivore) {
        hasHerbivore = true;
      } else if (fish.diet == Diet.omnivore) {
        hasOmnivore = true;
      }
    }

    if (hasOmnivore) {
      return kRecFoodOmnivore;
    }

    if (hasCarnivore && hasHerbivore) {
      return kRecFoodOmnivore;
    }

    if (hasHerbivore && !hasCarnivore) {
      return kRecFoodHerbivore;
    }

    if (hasCarnivore && !hasHerbivore) {
      return kRecFoodCarnivore;
    }

    return null;
  }

  static List<Species> determineFishOverMinTankSize(
      List<Species> fishList, int tankSize) {
    List<Species> overSizedFish = [];

    for (var fish in fishList) {
      if (fish.minTankSize > tankSize && (!overSizedFish.contains(fish))) {
        overSizedFish.add(fish);
      }
    }

    return overSizedFish;
  }
}
