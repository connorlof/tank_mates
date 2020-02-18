import 'package:flutter/material.dart';

const String appName = 'Tank Mates';
const kCardColor = Color(0xFF8D8E98);

const kParameterLabelTextStyle = TextStyle(
  fontSize: 14.0,
  color: Color(0xFF8D8E98),
  fontFamily: 'Oswald',
);

const kParameterValueTextStyle = TextStyle(
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
  const AppBarChoice(title: 'New Tank', icon: Icons.directions_car),
  const AppBarChoice(title: 'Saved Tanks', icon: Icons.directions_car),
  const AppBarChoice(title: 'About', icon: Icons.directions_car),
  const AppBarChoice(title: 'App Settings', icon: Icons.directions_bike),
];

class AppBarChoice {
  const AppBarChoice({this.title, this.icon});

  final String title;
  final IconData icon;
}
