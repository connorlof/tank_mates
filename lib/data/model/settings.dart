class Settings {
  TemperatureUnit temperatureUnit;
  VolumeUnit volumeUnit;

  Settings(this.temperatureUnit, this.volumeUnit);

  Settings.general(fahrenheit, liters);
}

enum TemperatureUnit { fahrenheit, celsius }

enum VolumeUnit { gallons, liters }
