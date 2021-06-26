import 'package:hive/hive.dart';

part 'SpeciesRecord.g.dart';

@HiveType(typeId: 1)
class SpeciesRecord {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String scientificName;

  @HiveField(2)
  final String speciesGroup;

  @HiveField(3)
  final int aggressiveness;

  @HiveField(4)
  final double phMin;

  @HiveField(5)
  final double phMax;

  @HiveField(6)
  final int tempMin;

  @HiveField(7)
  final int tempMax;

  @HiveField(8)
  final int hardnessMin;

  @HiveField(9)
  final int hardnessMax;

  @HiveField(10)
  final int careLevel;

  @HiveField(11)
  final double maximumAdultSize;

  @HiveField(12)
  final int diet;

  @HiveField(13)
  final int minTankSize;

  SpeciesRecord(
      this.name,
      this.scientificName,
      this.speciesGroup,
      this.aggressiveness,
      this.phMin,
      this.phMax,
      this.tempMin,
      this.tempMax,
      this.hardnessMin,
      this.hardnessMax,
      this.careLevel,
      this.maximumAdultSize,
      this.diet,
      this.minTankSize);
}
