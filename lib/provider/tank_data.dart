import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:tank_mates/models/fish.dart';
import 'package:tank_mates/models/tank.dart';
import 'package:tank_mates/util/constants.dart';
import 'package:tank_mates/util/fish_comparator.dart';
import 'package:tank_mates/util/tank_validator.dart';

class TankData extends ChangeNotifier {
  List<Fish> _fish = [];
  Tank _tank = Tank();
  TankValidator tankValidator = TankValidator();

  UnmodifiableListView<Fish> get addedFish {
    return UnmodifiableListView(_fish);
  }

  Tank get tank {
    return _tank;
  }

  int get numFish {
    return _fish.length;
  }

  void addFish(Fish fish) {
    _fish.add(fish);
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

    List<Fish> oversizedFish =
        FishComparator.determineFishOverMinTankSize(_fish, _tank.gallons);
    if (oversizedFish.length > 0) {
      for (Fish fish in oversizedFish) {
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

  void removeFish(Fish fish) {
    _fish.remove(fish);
    notifyListeners();
  }

  void resetTank() {
    _tank = Tank();
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
}
