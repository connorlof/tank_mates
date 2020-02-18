import 'package:flutter/material.dart';
import 'package:tank_mates/util/constants.dart';

class SavedTanksScreen extends StatefulWidget {
  static String id = 'saved_tanks_screen';

  @override
  _SavedTanksScreenState createState() => _SavedTanksScreenState();
}

class _SavedTanksScreenState extends State<SavedTanksScreen> {
  AppBarChoice _topBarIndex = appBarChoices[0]; // The app's "state".

  void _selectTopIndex(AppBarChoice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _topBarIndex = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
        actions: <Widget>[
          // overflow menu
          PopupMenuButton<AppBarChoice>(
            icon: Icon(Icons.opacity),
            onSelected: _selectTopIndex,
            itemBuilder: (BuildContext context) {
              return appBarChoices.map((AppBarChoice choice) {
                return PopupMenuItem<AppBarChoice>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Text('Saved Tanks'),
    );
  }
}
