import 'package:flutter/widgets.dart';
import 'package:tank_mates/data/model/species.dart';

class EditSpeciesViewModel extends ChangeNotifier {
  Species _activeSpecies = Species.empty();
  double currentSize = 0;

  Species get activeSpecies {
    return _activeSpecies;
  }

  void setActiveSpecies(Species species) {
    _activeSpecies = species;
    currentSize = species.currentSize;
  }

  void updateIsAdult(bool isAdult) {
    _activeSpecies.isAdult = isAdult;

    if (!isAdult)
      _activeSpecies.currentSize = currentSize;
    else
      _activeSpecies.currentSize = _activeSpecies.maximumAdultSize;
  }

  void updateCurrentSize(double size) {
    _activeSpecies.currentSize = size;
  }
}
