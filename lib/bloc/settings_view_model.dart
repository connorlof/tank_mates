import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:tank_mates/data/model/settings.dart';
import 'package:tank_mates/data/persistence/dao/settings_dao.dart';

class SettingsViewModel extends ChangeNotifier {
  SettingsDao _settingsDao = SettingsDao();
  Settings _currentSettings = Settings.general();

  Future loadSettings() async {
    Settings settings = await _settingsDao.getSettings();

    if (settings != null) {
      _currentSettings = settings;
      _settingsDao.update(settings);
    }
  }

  Settings get settings {
    return _currentSettings;
  }

  void updateTemperatureUnit(TemperatureUnit newUnit) async {
    _currentSettings.temperatureUnit = newUnit;
    _settingsDao.update(settings);
    _currentSettings = settings;
  }

  void updateVolumeUnit(VolumeUnit newUnit) async {
    _currentSettings.volumeUnit = newUnit;
    _settingsDao.update(settings);
    _currentSettings = settings;
  }

  int volumeQuantity(int gallons) {
    VolumeUnit volumeUnit = _currentSettings.volumeUnit;

    if (volumeUnit == VolumeUnit.gallons) {
      return gallons;
    } else {
      int liters = (gallons / 0.26417).round();
      return liters;
    }
  }

  String volumeUnitString() {
    VolumeUnit volumeUnit = _currentSettings.volumeUnit;

    if (volumeUnit == VolumeUnit.gallons) {
      return 'gallon';
    } else {
      return 'liter';
    }
  }

  int temperatureQuantity(int fahrenheit) {
    TemperatureUnit temperatureUnit = _currentSettings.temperatureUnit;

    if (temperatureUnit == TemperatureUnit.fahrenheit) {
      return fahrenheit;
    } else {
      int celsius = ((5 / 9) * (fahrenheit - 32)).round();
      return celsius;
    }
  }

  String temperatureUnitString() {
    TemperatureUnit temperatureUnit = _currentSettings.temperatureUnit;

    if (temperatureUnit == TemperatureUnit.fahrenheit) {
      return '°F';
    } else {
      return '°C';
    }
  }
}