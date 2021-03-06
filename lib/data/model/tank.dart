import 'dart:collection';

import 'package:tank_mates/data/model/species.dart';

class Tank {
  int id;
  String name;
  int gallons;
  List<Species> species;

  List<String> speciesNames() {
    List<Species> distinctFish = LinkedHashSet<Species>.from(species).toList();

    List<int> numFish = List.filled(distinctFish.length, 0);
    List<String> consolidatedList = [];

    for (int i = 0; i < distinctFish.length; i++) {
      for (Species fish in species) {
        if (distinctFish[i] == fish) {
          numFish[i]++;
        }
      }

      consolidatedList.add('${distinctFish[i].name} x${numFish[i]}');
    }

    return consolidatedList;
  }

  Tank(this.id, this.name, this.gallons, this.species);
}
