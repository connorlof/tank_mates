import 'package:tank_mates/models/fish.dart';

class FishComparator {
  //String phRange = "6.9-7.1";
  //String temperatureRange = "75-86";
  //String hardness = "1-10";

  //String maximumaAdultSize = "5";
  //String diet = "Carnivore";

  static Aggressiveness determineAggressiveness(List<Fish> fishList) {
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

  static CareLevel determineCareLevel(List<Fish> fishList) {
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

  static int determineMinTankSize(List<Fish> fishList) {
    int greatestMinTank = 0;

    for (var fish in fishList) {
      if (fish.minTankSize > greatestMinTank) {
        greatestMinTank = fish.minTankSize;
      }
    }

    return greatestMinTank;
  }

  //todo: determine better formula other than inch per gallon
  static int determineStockingPercent(List<Fish> fishList, int tankGallons) {
    if (fishList.isEmpty) {
      return 0;
    }

    if (tankGallons == 0) {
      return 999;
    }

    double stockingPercent = 0.00;
    double totalInchesOfFish = 0.00;

    for (var fish in fishList) {
      totalInchesOfFish += fish.maximumaAdultSize;
    }

    stockingPercent = totalInchesOfFish / tankGallons * 100;

    return stockingPercent.round();
  }

  //todo: take unit setting into account, Fahrenheit only for now
  static int determineMinTemp(List<Fish> fishList) {
    int minTemp = 0;

    for (var fish in fishList) {
      if (minTemp < fish.tempMin) {
        minTemp = fish.tempMin;
      }
    }

    return minTemp;
  }

  //todo: take unit setting into account, Fahrenheit only for now
  static int determineMaxTemp(List<Fish> fishList) {
    int maxTemp = 100;

    for (var fish in fishList) {
      if (maxTemp > fish.tempMax) {
        maxTemp = fish.tempMax;
      }
    }

    return maxTemp;
  }
}
