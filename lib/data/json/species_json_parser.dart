import 'package:tank_mates/data/json/species_json_data.dart';
import 'package:tank_mates/data/model/species.dart';

class SpeciesJsonParser {
  SpeciesJsonParser();

  Species outputValidatedFish(SpeciesJsonData fishPodo) {
    Species newFishObj = new Species.empty();

    try {
      newFishObj.name = fishPodo.name;
      newFishObj.scientificName = fishPodo.scientificName;
      newFishObj.speciesGroup = fishPodo.speciesGroup;

      newFishObj.aggressiveness =
          parseAggressivenessFromString(fishPodo.aggressiveness);

      newFishObj.phMin = parsePhMinFromRange(fishPodo.phRange);
      newFishObj.phMax = parsePhMaxFromRange(fishPodo.phRange);

      newFishObj.tempMin = parseTempMinFromRange(fishPodo.temperatureRange);
      newFishObj.tempMax = parseTempMaxFromRange(fishPodo.temperatureRange);

      newFishObj.hardnessMin = parseHardnessMinFromRange(fishPodo.hardness);
      newFishObj.hardnessMax = parseHardnessMaxFromRange(fishPodo.hardness);

      newFishObj.careLevel = parseCareLevelFromString(fishPodo.careLevel);
      newFishObj.maximumAdultSize = parseMaxSize(fishPodo.maximumAdultSize);
      newFishObj.diet = parseDietFromString(fishPodo.diet);
      newFishObj.minTankSize = parseMinTankSize(fishPodo.minTankSize);
    } catch (e) {}

    return newFishObj;
  }

  Aggressiveness parseAggressivenessFromString(String aggrString) {
    switch (aggrString.toLowerCase().trim()) {
      case "aggressive":
        {
          return Aggressiveness.aggressive;
        }
        break;
      case "moderate":
        {
          return Aggressiveness.moderate;
        }
        break;
      case "peaceful":
        {
          return Aggressiveness.peaceful;
        }
        break;
      case "semi_aggressive":
        {
          return Aggressiveness.semi_aggressive;
        }
        break;
      default:
        {
          return Aggressiveness.moderate;
        }
        break;
    }
  }

  double parsePhMinFromRange(String phRangeString) {
    List<String> splitRangeString = phRangeString.split('-');
    return double.parse(splitRangeString[0].trim());
  }

  double parsePhMaxFromRange(String phRangeString) {
    List<String> splitRangeString = phRangeString.split('-');
    return double.parse(splitRangeString[1].trim());
  }

  int parseTempMinFromRange(String tempRangeString) {
    List<String> splitRangeString = tempRangeString.split('-');
    return int.parse(splitRangeString[0].trim());
  }

  int parseTempMaxFromRange(String tempRangeString) {
    List<String> splitRangeString = tempRangeString.split('-');
    return int.parse(splitRangeString[1].trim());
  }

  int parseHardnessMinFromRange(String hardnessRangeString) {
    List<String> splitRangeString = hardnessRangeString.split('-');
    return int.parse(splitRangeString[0].trim());
  }

  int parseHardnessMaxFromRange(String hardnessRangeString) {
    List<String> splitRangeString = hardnessRangeString.split('-');
    return int.parse(splitRangeString[1].trim());
  }

  CareLevel parseCareLevelFromString(String careLevelString) {
    switch (careLevelString.toLowerCase().trim()) {
      case "easy":
        {
          return CareLevel.easy;
        }
        break;
      case "moderate":
        {
          return CareLevel.moderate;
        }
        break;
      case "difficult":
        {
          return CareLevel.difficult;
        }
        break;
      case "expert":
        {
          return CareLevel.expert;
        }
        break;
      default:
        {
          return CareLevel.moderate;
        }
        break;
    }
  }

  double parseMaxSize(String maxSizeString) {
    return double.parse(maxSizeString.trim());
  }

  Diet parseDietFromString(String aggrString) {
    switch (aggrString.toLowerCase().trim()) {
      case "herbivore":
        {
          return Diet.herbivore;
        }
        break;
      case "omnivore":
        {
          return Diet.omnivore;
        }
        break;
      case "carnivore":
        {
          return Diet.carnivore;
        }
        break;
      default:
        {
          return Diet.omnivore;
        }
        break;
    }
  }

  int parseMinTankSize(String minTankSizeString) {
    return int.parse(minTankSizeString.trim());
  }
}
