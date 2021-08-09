import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:tank_mates/bloc/fish_comparator.dart';
import 'package:tank_mates/bloc/tank_validator.dart';
import 'package:tank_mates/data/model/species.dart';
import 'package:tank_mates/data/model/tank.dart';
import 'package:tank_mates/data/model/tank_state.dart';
import 'package:tank_mates/data/persistence/dao/tank_dao.dart';
import 'package:tank_mates/util/constants.dart';

class EditTankViewModel extends ChangeNotifier {
  TankState _tankState = TankState();
  TankDao _tankDao = TankDao();
  int id = -1;

  List<Species> availableFish = [];
  TankValidator tankValidator = TankValidator();

  void updateTankState() {
    _updateTankValues();
    notifyListeners();
  }

  void _updateTankValues() {
    _tankState.aggressiveness =
        FishComparator.determineAggressiveness(_tankState.fishAdded);
    _tankState.careLevel =
        FishComparator.determineCareLevel(_tankState.fishAdded);

    _tankState.percentFilled = FishComparator.determineStockingPercent(
        _tankState.fishAdded, _tankState.gallons);

    _tankState.tempMin = FishComparator.determineMinTemp(_tankState.fishAdded);
    _tankState.tempMax = FishComparator.determineMaxTemp(_tankState.fishAdded);

    _tankState.phMin = FishComparator.determineMinPh(_tankState.fishAdded);
    _tankState.phMax = FishComparator.determineMaxPh(_tankState.fishAdded);

    _tankState.hardnessMin =
        FishComparator.determineMinHardness(_tankState.fishAdded);
    _tankState.hardnessMax =
        FishComparator.determineMaxHardness(_tankState.fishAdded);

    if (_tankState.percentFilled > 130) {
      _tankState.status = TankStatus.Overstocked;
    } else if (!tankValidator.isValidTank(_tankState)) {
      _tankState.status = TankStatus.Warning;
    } else {
      _tankState.status = TankStatus.Good;
    }

    // Recommendations
    _tankState.recommendationList.clear();

    if (_tankState.status == TankStatus.Warning) {
      _tankState.recommendationList.add(kRecParamWarning);
    }

    if (_tankState.status == TankStatus.Overstocked) {
      _tankState.recommendationList.add(kRecUpgradeTank);
    }

    List<Species> oversizedFish = FishComparator.determineFishOverMinTankSize(
        _tankState.fishAdded, _tankState.gallons);
    if (oversizedFish.length > 0) {
      for (Species fish in oversizedFish) {
        _tankState.recommendationList.add(
            '${fish.name} needs at least a ${fish.minTankSize} gallon tank');
      }
    }

    _tankState.recommendationList
        .add(FishComparator.determineRecommendationFood(_tankState.fishAdded));

    if (_tankState.fishAdded.isEmpty) {
      _tankState.recommendationList = ['Add some fish to your tank!'];
    }
  }

  UnmodifiableListView<Species> get addedFish {
    return UnmodifiableListView(_tankState.fishAdded);
  }

  TankState get tankState {
    return _tankState;
  }

  UnmodifiableListView<String> get addedFishConsolidated {
    List<Species> distinctFish =
        LinkedHashSet<Species>.from(_tankState.fishAdded).toList();
    List<int> numFish = List.filled(distinctFish.length, 0);
    List<String> consolidatedList = [];

    for (int i = 0; i < distinctFish.length; i++) {
      for (Species fish in _tankState.fishAdded) {
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

    for (Species fish in _tankState.fishAdded) {
      fishNames.add(fish.name);
    }

    return fishNames;
  }

  void addFish(Species fish) {
    _tankState.fishAdded.add(fish);
    updateTankState();
  }

  void removeFishOnce(Species species) {
    int lastIndex = _tankState.fishAdded.lastIndexOf(species);

    if (lastIndex > -1) _tankState.fishAdded.removeAt(lastIndex);

    updateTankState();
  }

  void removeFish(Species species) {
    _tankState.fishAdded.removeWhere((item) => item.key == species.key);
    updateTankState();
  }

  void setTankName(String name) {
    _tankState.tankName = name;
  }

  void setTankGallons(int newGallons) {
    _tankState.gallons = newGallons;
  }

  void setAvailableSpecies(List<Species> fish) {
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
    _tankState.fishAdded = [];

    id = tankDataToLoad.id;
    _tankState.tankName = tankDataToLoad.name;
    _tankState.gallons = tankDataToLoad.gallons;

    List<String> addedSpeciesKeys =
        tankDataToLoad.species.map((species) => species.key).toList();

    for (String key in addedSpeciesKeys) {
      //find fish object by key (scientific name)
      for (Species fish in availableFish) {
        if (fish.key == key) {
          _tankState.fishAdded.add(fish);
        }
      }
    }

    updateTankState();
  }

  void resetTank() async {
    _tankState = TankState();
    id = -1;

    updateTankState();
  }

  void saveTank() async {
    final currentTank =
        Tank(id, _tankState.tankName, _tankState.gallons, _tankState.fishAdded);

    final savedTank = await _tankDao.updateOrInsert(currentTank);
    id = savedTank.id;
    print('Tank saved, current ID: $id');
  }

  void deleteTank(Tank tank) async {
    _tankDao.deleteTank(tank.id);
    notifyListeners();
  }

  Future<List<Tank>> loadSavedTanks() async {
    return await _tankDao.getAllTanks(availableFish);
  }

  Species speciesFromConsolidatedString(String speciesString) {
    var parts = speciesString.split(' ');
    var speciesName = parts.sublist(1).join(' ').trim();

    return availableFish.where((species) => species.name == speciesName).first;
  }

  int quantityOfSpecies(Species species) {
    return _tankState.fishAdded.where((spec) => spec == species).length;
  }

  List<String> speciesGroups() {
    var speciesGroups =
        availableFish.map((species) => species.speciesGroup).toSet().toList();
    speciesGroups.sort();
    return speciesGroups;
  }
}
