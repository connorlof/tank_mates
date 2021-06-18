import 'package:hive/hive.dart';
import 'package:tank_mates/models/species.dart';
import 'package:tank_mates/persistence/hive/SpeciesRecord.dart';
import 'package:tank_mates/persistence/repository/species_data_source.dart';

class SpeciesHiveDataSource extends SpeciesDataSource {
  Box _box = Hive.box('species');

  Future insertOrUpdate(Species species) {
    return _box.put(species.scientificName, toRecord(species));
  }

  Future delete(Species species) {
    return _box.delete(species.scientificName);
  }

  Species getByScientificName(String name) {
    return toModel(_box.get(name));
  }

  Species toModel(SpeciesRecord record) {
    Species model = Species();

    model.name = record.name;
    model.scientificName = record.scientificName;
    model.speciesGroup = record.speciesGroup;
    model.aggressiveness = Aggressiveness.values[record.aggressiveness];
    model.phMin = record.phMin;
    model.phMax = record.phMax;
    model.tempMin = record.tempMin;
    model.tempMax = record.tempMax;
    model.hardnessMin = record.hardnessMin;
    model.hardnessMax = record.hardnessMax;
    model.careLevel = CareLevel.values[record.careLevel];
    model.maximumAdultSize = record.maximumAdultSize;
    model.diet = Diet.values[record.diet];
    model.minTankSize = record.minTankSize;

    return model;
  }

  SpeciesRecord toRecord(Species model) {
    return SpeciesRecord(
        model.name,
        model.scientificName,
        model.speciesGroup,
        model.aggressiveness.index,
        model.phMin,
        model.phMax,
        model.tempMin,
        model.tempMax,
        model.hardnessMin,
        model.hardnessMax,
        model.careLevel.index,
        model.maximumAdultSize,
        model.diet.index,
        model.minTankSize);
  }
}
