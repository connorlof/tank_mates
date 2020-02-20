import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tank_mates/screens/edit_tank_screen.dart';
import 'package:tank_mates/screens/saved_tanks_screen.dart';
import 'package:tank_mates/util/constants.dart';

void main() => runApp(TankMatesApp());

class TankMatesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: kBackGroundColor));
    return MaterialApp(
      theme: ThemeData(
          primaryColor: kBackGroundColor,
          secondaryHeaderColor: kPrimaryColor,
          accentColor: kPrimaryColor,
          primaryTextTheme: TextTheme(
              title: TextStyle(
            color: kPrimaryColor,
          ))),
      initialRoute: EditTankScreen.id,
      routes: {
        EditTankScreen.id: (context) => EditTankScreen(),
        SavedTanksScreen.id: (context) => SavedTanksScreen(),
      },
    );
  }
}
