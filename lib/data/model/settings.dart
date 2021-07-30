class Settings {
  TemperatureUnit temperatureUnit;
  VolumeUnit volumeUnit;

  Settings(this.temperatureUnit, this.volumeUnit);

  Settings.general() {
    this.temperatureUnit = TemperatureUnit.fahrenheit;
    this.volumeUnit = VolumeUnit.gallons;
  }
}

enum TemperatureUnit { fahrenheit, celsius }

enum VolumeUnit { gallons, liters }
