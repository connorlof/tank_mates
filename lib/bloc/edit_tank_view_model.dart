import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:tank_mates/bloc/species_comparator.dart';
import 'package:tank_mates/bloc/tank_validator.dart';
import 'package:tank_mates/data/model/species.dart';
import 'package:tank_mates/data/model/tank.dart';
import 'package:tank_mates/data/model/tank_state.dart';
import 'package:tank_mates/data/persistence/dao/tank_dao.dart';
import 'package:tank_mates/util/constants.dart';

class EditTankViewModel extends ChangeNotifier {
  TankState _tankState = TankState();
  TankDao _tankDao = TankDao();

  List<Species> availableSpecies = [];
  int speciesFilter = 0;
  TankValidator tankValidator = TankValidator();

  void updateTankState() {
    _updateTankValues();
    notifyListeners();
  }

  void _updateTankValues() {
    _tankState.aggressiveness =
        SpeciesComparator.determineAggressiveness(_tankState.speciesAdded);
    _tankState.careLevel =
        SpeciesComparator.determineCareLevel(_tankState.speciesAdded);

    _tankState.percentFilled = SpeciesComparator.determineStockingPercent(
        _tankState.speciesAdded, _tankState.gallons);

    _tankState.tempMin =
        SpeciesComparator.determineMinTemp(_tankState.speciesAdded);
    _tankState.tempMax =
        SpeciesComparator.determineMaxTemp(_tankState.speciesAdded);

    _tankState.phMin =
        SpeciesComparator.determineMinPh(_tankState.speciesAdded);
    _tankState.phMax =
        SpeciesComparator.determineMaxPh(_tankState.speciesAdded);

    _tankState.hardnessMin =
        SpeciesComparator.determineMinHardness(_tankState.speciesAdded);
    _tankState.hardnessMax =
        SpeciesComparator.determineMaxHardness(_tankState.speciesAdded);

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

    List<Species> oversizedFish =
        SpeciesComparator.determineFishOverMinTankSize(
            _tankState.speciesAdded, _tankState.gallons);
    if (oversizedFish.length > 0) {
      for (Species fish in oversizedFish) {
        _tankState.recommendationList.add(
            '${fish.name} needs at least a ${fish.minTankSize} gallon tank');
      }
    }

    _tankState.recommendationList.add(
        SpeciesComparator.determineRecommendationFood(_tankState.speciesAdded));

    if (_tankState.speciesAdded.isEmpty) {
      _tankState.recommendationList = ['Add some fish to your tank!'];
    }
  }

  UnmodifiableListView<Species> get addedFish {
    return UnmodifiableListView(_tankState.speciesAdded);
  }

  TankState get tankState {
    return _tankState;
  }

  UnmodifiableListView<String> get addedFishConsolidated {
    List<Species> distinctFish =
        LinkedHashSet<Species>.from(_tankState.speciesAdded).toList();
    List<int> numFish = List.filled(distinctFish.length, 0);
    List<String> consolidatedList = [];

    for (int i = 0; i < distinctFish.length; i++) {
      for (Species fish in _tankState.speciesAdded) {
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

    for (Species fish in _tankState.speciesAdded) {
      fishNames.add(fish.name);
    }

    return fishNames;
  }

  void addFish(Species fish) {
    _tankState.speciesAdded.add(fish);
    updateTankState();
  }

  void removeFishOnce(Species species) {
    int lastIndex = _tankState.speciesAdded.lastIndexOf(species);

    if (lastIndex > -1) _tankState.speciesAdded.removeAt(lastIndex);

    updateTankState();
  }

  void removeFish(Species species) {
    _tankState.speciesAdded.removeWhere((item) => item.key == species.key);
    updateTankState();
  }

  void setTankName(String name) {
    _tankState.tankName = name;
  }

  void setTankGallons(int newGallons) {
    _tankState.gallons = newGallons;
  }

  void setAvailableSpecies(List<Species> fish) {
    availableSpecies = fish;
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
    _tankState.speciesAdded = [];

    _tankState.id = tankDataToLoad.id;
    _tankState.tankName = tankDataToLoad.name;
    _tankState.gallons = tankDataToLoad.gallons;

    List<String> addedSpeciesKeys =
        tankDataToLoad.species.map((species) => species.key).toList();

    for (String key in addedSpeciesKeys) {
      //find fish object by key (scientific name)
      for (Species fish in availableSpecies) {
        if (fish.key == key) {
          _tankState.speciesAdded.add(fish);
        }
      }
    }

    updateTankState();
  }

  void resetTank() async {
    _tankState = TankState();
    speciesFilter = 0;

    updateTankState();
  }

  void saveTank() async {
    final currentTank = Tank(_tankState.id, _tankState.tankName,
        _tankState.gallons, _tankState.speciesAdded);

    final savedTank = await _tankDao.updateOrInsert(currentTank);
    _tankState.id = savedTank.id;
  }

  void deleteTank(Tank tank) async {
    _tankDao.deleteTank(tank.id);
    notifyListeners();
  }

  Future<List<Tank>> loadSavedTanks() async {
    return await _tankDao.getAllTanks(availableSpecies);
  }

  Species speciesFromConsolidatedString(String speciesString) {
    var parts = speciesString.split(' ');
    var speciesName = parts.sublist(1).join(' ').trim();

    return availableSpecies
        .where((species) => species.name == speciesName)
        .first;
  }

  int quantityOfSpecies(Species species) {
    return _tankState.speciesAdded.where((spec) => spec == species).length;
  }

  List<String> speciesGroups() {
    var speciesGroups = availableSpecies
        .map((species) => species.speciesGroup)
        .toSet()
        .toList();
    speciesGroups.sort();
    return speciesGroups;
  }

  void setSpeciesFilter(int value) {
    speciesFilter = value;
    notifyListeners();
  }
}
