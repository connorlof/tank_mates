import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:tank_mates/bloc/fish_comparator.dart';
import 'package:tank_mates/bloc/tank_validator.dart';
import 'package:tank_mates/data/model/species.dart';
import 'package:tank_mates/data/model/tank.dart';
import 'package:tank_mates/data/model/tank_state.dart';
import 'package:tank_mates/util/constants.dart';

class EditTankViewModel extends ChangeNotifier {
  List<Species> _fish = [];
  TankState _tankState = TankState();
  int id = -1;
  Tank tankDbEntity;

  List<Species> availableFish = [];
  TankValidator tankValidator = TankValidator();

  void updateTankState() {
    updateTankValues();
    notifyListeners();
  }

  void updateTankValues() {
    _tankState.aggressiveness = FishComparator.determineAggressiveness(_fish);
    _tankState.careLevel = FishComparator.determineCareLevel(_fish);

    _tankState.percentFilled =
        FishComparator.determineStockingPercent(_fish, _tankState.gallons);

    _tankState.tempMin = FishComparator.determineMinTemp(_fish);
    _tankState.tempMax = FishComparator.determineMaxTemp(_fish);

    _tankState.phMin = FishComparator.determineMinPh(_fish);
    _tankState.phMax = FishComparator.determineMaxPh(_fish);

    _tankState.hardnessMin = FishComparator.determineMinHardness(_fish);
    _tankState.hardnessMax = FishComparator.determineMaxHardness(_fish);

    _tankState.recommendationList.clear();
    _tankState.recommendationList
        .add(FishComparator.determineRecommendationFood(_fish));

    if (_tankState.status == TankStatus.Overstocked) {
      _tankState.recommendationList.add(kRecUpgradeTank);
    }

    List<Species> oversizedFish =
        FishComparator.determineFishOverMinTankSize(_fish, _tankState.gallons);
    if (oversizedFish.length > 0) {
      for (Species fish in oversizedFish) {
        _tankState.recommendationList.add(
            '${fish.name} needs at least a ${fish.minTankSize} gallon tank');
      }
    }

    if (!tankValidator.isValidTank(_tankState)) {
      _tankState.status = TankStatus.Incompatible;
    } else if (_tankState.percentFilled > 130) {
      _tankState.status = TankStatus.Overstocked;
    } else {
      _tankState.status = TankStatus.Good;
    }
  }

  UnmodifiableListView<Species> get addedFish {
    return UnmodifiableListView(_fish);
  }

  TankState get tankState {
    return _tankState;
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
    updateTankState();
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

    updateTankState();
  }

  void setTankName(String name) {
    _tankState.tankName = name;
  }

  void setTankGallons(int newGallons) {
    _tankState.gallons = newGallons;
  }

  void setAvailableFish(List<Species> fish) {
    availableFish = fish;
  }

  void incrementTankGallons() {
    _tankState.gallons++;
    updateTankState();
  }

  void decrementTankGallons() {
    _tankState.gallons--;
    updateTankState();
  }

  void loadSavedTank(Tank tankDataToLoad) {
    _tankState = TankState();
    _fish = [];
    tankDbEntity = tankDataToLoad;

    id = tankDataToLoad.id;
    _tankState.tankName = tankDataToLoad.name;
    _tankState.gallons = tankDataToLoad.gallons;

    //TODO: move to method, TEST
    List<String> addedFishNames =
        tankDataToLoad.species.map((species) => species.name);

    for (String name in addedFishNames) {
      //find fish object by name
      for (Species fish in availableFish) {
        if (fish.name == name) {
          _fish.add(fish);
        }
      }
    }

    // TODO: This should be calculated from the species included
    //_tank.recommendationList = tankDataToLoad.recommendations;

    updateTankState();
  }

  void resetTank() async {
    _tankState = TankState();
    _fish = [];
    id = -1;

    updateTankState();
  }
}
