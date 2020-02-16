import 'package:flutter/material.dart';
import 'package:tank_mates/screens/edit_tank_screen.dart';
import 'package:tank_mates/screens/saved_tanks_screen.dart';

void main() => runApp(TankMatesApp());

class TankMatesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      initialRoute: EditTankScreen.id,
      routes: {
        EditTankScreen.id: (context) => EditTankScreen(),
        SavedTanksScreen.id: (context) => SavedTanksScreen(),
      },
    );
  }
}
