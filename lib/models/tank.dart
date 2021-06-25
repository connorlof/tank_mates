class Tank {
  int id;
  String name;
  int gallons;
  String status;
  int percentFilled;
  List<String> recommendations;
  // TODO: Load actual species
  List<String> species;

  Tank(this.id, this.name, this.gallons, this.status, this.percentFilled,
      this.recommendations, this.species);
}
