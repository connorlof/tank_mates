import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:tank_mates/data/model/settings.dart';
import 'package:tank_mates/data/persistence/dao/settings_dao.dart';

class SettingsViewModel extends ChangeNotifier {
  SettingsDao _settingsDao = SettingsDao();

  Future<Settings> get settings async {
    return _settingsDao.getSettings();
  }

  void updateTemperatureUnit(TemperatureUnit newUnit) async {
    Settings settings = await _settingsDao.getSettings();
    settings.temperatureUnit = newUnit;
    _settingsDao.update(settings);
  }

  void updateVolumeUnit(VolumeUnit newUnit) async {
    Settings settings = await _settingsDao.getSettings();
    settings.volumeUnit = newUnit;
    _settingsDao.update(settings);
  }

  Future<String> getVolumeString(int gallons) async {
    Settings settings = await _settingsDao.getSettings();
    VolumeUnit volumeUnit = settings.volumeUnit;

    if (volumeUnit == VolumeUnit.gallons) {
      return '$gallons gallons';
    } else {
      int liters = (gallons / 0.26417).round();
      return '$liters liters';
    }
  }

  // Get Temperature
  Future<String> getTemperatureString(int fahrenheit) async {
    Settings settings = await _settingsDao.getSettings();
    TemperatureUnit temperatureUnit = settings.temperatureUnit;

    if (temperatureUnit == TemperatureUnit.fahrenheit) {
      return '$fahrenheit F';
    } else {
      int celsius = ((5 / 9) * (fahrenheit - 32)).round();
      return '$celsius C';
    }
  }
}
