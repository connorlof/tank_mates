import 'package:tank_mates/data/model/species.dart';

class Tank {
  int id;
  String name;
  int gallons;
  List<Species> species;

  Tank(this.id, this.name, this.gallons, this.species);
}
