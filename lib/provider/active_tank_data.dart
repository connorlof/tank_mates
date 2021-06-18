import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:tank_mates/models/active_tank.dart';
import 'package:tank_mates/models/species.dart';
import 'package:tank_mates/persistence/tank_database.dart';
import 'package:tank_mates/util/constants.dart';
import 'package:tank_mates/util/fish_comparator.dart';
import 'package:tank_mates/util/tank_validator.dart';

class ActiveTankData extends ChangeNotifier {
  List<Species> _fish = [];
  ActiveTank _tank = ActiveTank();
  int id = -1;
  Tank tankDbEntity;

  List<Species> availableFish = [];
  TankValidator tankValidator = TankValidator();

  UnmodifiableListView<Species> get addedFish {
    return UnmodifiableListView(_fish);
  }

  ActiveTank get tank {
    return _tank;
  }

  int get numFish {
    return _fish.length;
  }

  UnmodifiableListView<String> get addedFishConsolidated {
    List<Species> distinctFish = LinkedHashSet<Species>.from(_fish).toList();
    List<int> numFish = List.filled(distinctFish.length, 0);
    List<String> consolidatedList = [];

    for (int i = 0; i < distinctFish.length; i++) {
      for (Species fish in _fish) {
        if (distinctFish[i] == fish) {
          numFish[i]++;
        }
      }

      consolidatedList.add('x${numFish[i]} ${distinctFish[i].name}');
    }

    return UnmodifiableListView(consolidatedList);
  }

  List<String> get addedFishNames {
    List<String> fishNames = [];

    for (Species fish in _fish) {
      fishNames.add(fish.name);
    }

    return fishNames;
  }

  void addFish(Species fish) {
    _fish.add(fish);
    updateTankValues();
    notifyListeners();
  }

  void removeFish(String fishName) {
    List<String> nameParts = fishName.split(' ');
    String trimmedName = '';

    for (int j = 1; j < nameParts.length; j++) {
      if (j > 1) {
        trimmedName = trimmedName + ' ';
      }

      trimmedName = trimmedName + nameParts[j];
    }

    _fish.removeWhere((item) => item.name == trimmedName);

    updateTankValues();
    notifyListeners();
  }

  void updateTankValues() {
    _tank.aggressiveness = FishComparator.determineAggressiveness(_fish);
    _tank.careLevel = FishComparator.determineCareLevel(_fish);

    _tank.percentFilled =
        FishComparator.determineStockingPercent(_fish, _tank.gallons);

    _tank.tempMin = FishComparator.determineMinTemp(_fish);
    _tank.tempMax = FishComparator.determineMaxTemp(_fish);

    _tank.phMin = FishComparator.determineMinPh(_fish);
    _tank.phMax = FishComparator.determineMaxPh(_fish);

    _tank.hardnessMin = FishComparator.determineMinHardness(_fish);
    _tank.hardnessMax = FishComparator.determineMaxHardness(_fish);

    _tank.recommendationList.clear();
    _tank.recommendationList
        .add(FishComparator.determineRecommendationFood(_fish));

    if (_tank.status == TankStatus.Overstocked) {
      _tank.recommendationList.add(kRecUpgradeTank);
    }

    List<Species> oversizedFish =
        FishComparator.determineFishOverMinTankSize(_fish, _tank.gallons);
    if (oversizedFish.length > 0) {
      for (Species fish in oversizedFish) {
        _tank.recommendationList.add(
            '${fish.name} needs at least a ${fish.minTankSize} gallon tank');
      }
    }

    if (!tankValidator.isValidTank(_tank)) {
      _tank.status = TankStatus.Incompatible;
    } else if (_tank.percentFilled > 130) {
      _tank.status = TankStatus.Overstocked;
    } else {
      _tank.status = TankStatus.Good;
    }
  }

  void setTankName(String name) {
    _tank.tankName = name;
  }

  void setTankGallons(int newGallons) {
    _tank.gallons = newGallons;
  }

  void setAvailableFish(List<Species> fish) {
    availableFish = fish;
  }

  void resetTank() async {
    _tank = ActiveTank();
    _fish = [];
    id = -1;

    notifyListeners();
  }

  void incrementTankGallons() {
    _tank.gallons++;
    updateTankValues();
    notifyListeners();
  }

  void decrementTankGallons() {
    _tank.gallons--;
    updateTankValues();
    notifyListeners();
  }

  void loadSavedTank(Tank tankDataToLoad) {
    _tank = ActiveTank();
    _fish = [];
    tankDbEntity = tankDataToLoad;

    id = tankDataToLoad.id;
    _tank.tankName = tankDataToLoad.name;
    _tank.gallons = tankDataToLoad.gallons;

    //TODO: move to method, TEST
    List<String> addedFishNames = tankDataToLoad.fishJson;

    for (String name in addedFishNames) {
      //find fish object by name
      for (Species fish in availableFish) {
        if (fish.name == name) {
          _fish.add(fish);
        }
      }
    }

    _tank.recommendationList = tankDataToLoad.recommendationList;

    updateTankValues();
  }
}
