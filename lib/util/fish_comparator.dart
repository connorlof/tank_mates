import 'package:tank_mates/models/fish.dart';

class FishComparator {
  //String aggressiveness = "aggressive";
  //String phRange = "6.9-7.1";
  //String temperatureRange = "75-86";
  //String hardness = "1-10";
  //String careLevel = "Moderate";
  //String maximumaAdultSize = "5";
  //String diet = "Carnivore";
  //String minTankSize = "30";

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
}
