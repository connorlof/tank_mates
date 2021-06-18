class Species {
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
}

enum Aggressiveness { aggressive, peaceful, semi_aggressive, moderate }

enum CareLevel { easy, moderate, difficult, expert }

enum Diet { herbivore, omnivore, carnivore }
