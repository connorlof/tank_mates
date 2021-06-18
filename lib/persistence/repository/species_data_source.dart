import 'package:tank_mates/models/species.dart';

abstract class SpeciesDataSource {
  Future insertOrUpdate(Species species);
  Future delete(Species species);
  Species getByScientificName(String name);
}
