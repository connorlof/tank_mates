class Species {
  String key;
  String name;
  String scientificName;
  String speciesGroup;
  Aggressiveness aggressiveness;
  double phMin;
  double phMax;
  int tempMin;
  int tempMax;
  int hardnessMin;
  int hardnessMax;
  CareLevel careLevel;
  double maximumAdultSize;
  Diet diet;
  int minTankSize;
  bool isAdult;
  double currentSize;

  double get size {
    if (currentSize == null)
      return maximumAdultSize;
    else
      return currentSize;
  }

  Species(
      this.key,
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
      this.minTankSize,
      this.isAdult,
      this.currentSize) {
    if (isAdult) currentSize = maximumAdultSize;
  }

  Species.empty();
}

enum Aggressiveness { aggressive, peaceful, semi_aggressive, moderate }

enum CareLevel { easy, moderate, difficult, expert }

enum Diet { herbivore, omnivore, carnivore }
