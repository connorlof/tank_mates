import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tank_mates/bloc/edit_tank_view_model.dart';
import 'package:tank_mates/bloc/settings_view_model.dart';
import 'package:tank_mates/data/model/settings.dart';
import 'package:tank_mates/util/constants.dart';

class SettingsScreen extends StatefulWidget {
  static String id = kIdSettingsScreen;

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  AppBarChoice _topBarIndex = appBarChoices[0]; // The app's "state".

  void _selectTopIndex(AppBarChoice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _topBarIndex = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    final SettingsViewModel settingsViewModel =
        Provider.of<SettingsViewModel>(context);
    final EditTankViewModel tankViewModel =
        Provider.of<EditTankViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kPrimaryColor, //change your color here
        ),
        title: Text(
          appName,
          style: kTextStyleHeader,
        ),
        actions: <Widget>[
          // overflow menu
          PopupMenuButton<AppBarChoice>(
            icon: Icon(Icons.opacity),
            onSelected: _selectTopIndex,
            itemBuilder: (BuildContext context) {
              return appBarChoices.map((AppBarChoice choice) {
                return PopupMenuItem<AppBarChoice>(
                  value: choice,
                  child: Text(
                    choice.title,
                    style: kTextStyleSmall,
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'App Settings',
            style: kTextStyleLarge,
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Temperature Unit',
                  style: kTextStyleSmall,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Radio(
                        value: 0,
                        groupValue:
                            settingsViewModel.settings.temperatureUnit.index,
                        onChanged: (value) {
                          setState(() {
                            settingsViewModel.updateTemperatureUnit(
                                TemperatureUnit.values[value]);
                            tankViewModel.updateTankState();
                          });
                        },
                      ),
                      Text(
                        'fahrenheit',
                        style: kTextStyleSmall,
                      ),
                      Radio(
                        value: 1,
                        groupValue:
                            settingsViewModel.settings.temperatureUnit.index,
                        onChanged: (value) {
                          setState(() {
                            settingsViewModel.updateTemperatureUnit(
                                TemperatureUnit.values[value]);
                            tankViewModel.updateTankState();
                          });
                        },
                      ),
                      Text(
                        'celsius',
                        style: kTextStyleSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Water Volume Unit',
                  style: kTextStyleSmall,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Radio(
                        value: 0,
                        groupValue: settingsViewModel.settings.volumeUnit.index,
                        onChanged: (value) {
                          setState(() {
                            settingsViewModel
                                .updateVolumeUnit(VolumeUnit.values[value]);
                            tankViewModel.updateTankState();
                          });
                        },
                      ),
                      Text(
                        'gallons',
                        style: kTextStyleSmall,
                      ),
                      Radio(
                        value: 1,
                        groupValue: settingsViewModel.settings.volumeUnit.index,
                        onChanged: (value) {
                          setState(() {
                            settingsViewModel
                                .updateVolumeUnit(VolumeUnit.values[value]);
                            tankViewModel.updateTankState();
                          });
                        },
                      ),
                      Text(
                        'liters',
                        style: kTextStyleSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
