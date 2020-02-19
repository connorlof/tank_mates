import 'package:flutter/material.dart';

const kIdEditTankScreen = 'edit_tank_screen';
const kIdSavedTanksScreen = 'saved_tanks_screen';
const kIdAboutScreen = 'about_screen';
const kIdSettingsScreen = 'settings_screen';

const String appName = 'Tank Mates';
const kCardColor = Color(0xFF8D8E98);

const kTextStyleSmall = TextStyle(
  fontSize: 14.0,
  color: Color(0xFF8D8E98),
  fontFamily: 'Oswald',
);

const kTextStyleLarge = TextStyle(
  fontSize: 32.0,
  fontWeight: FontWeight.w500,
  color: Color(0xFF8D8E98),
  fontFamily: 'Oswald',
);

const kRecommendationTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
  fontFamily: 'Oswald',
);

const List<AppBarChoice> appBarChoices = const <AppBarChoice>[
  const AppBarChoice('New Tank', kIdEditTankScreen),
  const AppBarChoice('Saved Tanks', kIdSavedTanksScreen),
  const AppBarChoice('App Settings', kIdSettingsScreen),
  const AppBarChoice('About', kIdAboutScreen),
];

class AppBarChoice {
  const AppBarChoice(this.title, this.id);

  final String title;
  final String id;
}
