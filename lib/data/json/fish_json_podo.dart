class FishJsonPodo {
  String name = "African Butterfly Fish";
  String scientificName = "Pantodon buchholzi";
  String speciesGroup = "misc";
  String aggressiveness = "aggressive";
  String phRange = "6.9-7.1";
  String temperatureRange = "75-86";
  String hardness = "1-10";
  String careLevel = "Moderate";
  String maximumAdultSize = "5";
  String diet = "Carnivore";
  String minTankSize = "30";

  FishJsonPodo(
      this.name,
      this.scientificName,
      this.speciesGroup,
      this.aggressiveness,
      this.phRange,
      this.temperatureRange,
      this.hardness,
      this.careLevel,
      this.maximumAdultSize,
      this.diet,
      this.minTankSize);

  factory FishJsonPodo.fromJson(dynamic json) {
    return FishJsonPodo(
      json['name'] as String,
      json['scientificName'] as String,
      json['speciesGroup'] as String,
      json['aggressiveness'] as String,
      json['phRange'] as String,
      json['temperatureRange'] as String,
      json['hardness'] as String,
      json['careLevel'] as String,
      json['maximumAdultSize'] as String,
      json['diet'] as String,
      json['minTankSize'] as String,
    );
  }

  @override
  String toString() {
    return 'Fish{name: $name, scientificName: $scientificName, speciesGroup: $speciesGroup, aggressiveness: $aggressiveness, phRange: $phRange, temperatureRange: $temperatureRange, hardness: $hardness, careLevel: $careLevel, maximumAdultSize: $maximumAdultSize, diet: $diet, minTankSize: $minTankSize}';
  }
}
