import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:tank_mates/models/fish.dart';

class AddedFishData extends ChangeNotifier {
  List<Fish> _fish = [];

  UnmodifiableListView<Fish> get addedFish {
    return UnmodifiableListView(_fish);
  }

  int get taskCount {
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

  void deleteTask(Fish fish) {
    _fish.remove(fish);
    notifyListeners();
  }
}
