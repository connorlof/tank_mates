import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:tank_mates/models/fish.dart';
import 'package:tank_mates/models/tank.dart';

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
    notifyListeners();
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
