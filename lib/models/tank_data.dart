import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:tank_mates/models/fish.dart';
import 'package:tank_mates/models/tank.dart';
import 'package:tank_mates/util/fish_comparator.dart';

class TankData extends ChangeNotifier {
  List<Fish> _fish = [];
  Tank _tank = Tank();

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

    //determineMinTankSize
  }

//  void updateFish(Fish newFish) {
//    task.toggleDone();
//    notifyListeners();
//  }

  void removeFish(Fish fish) {
    _fish.remove(fish);
    notifyListeners();
  }

  void resetTank() {
    _tank = Tank();
  }
}
