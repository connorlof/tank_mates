import 'package:flutter/material.dart';
import 'package:tank_mates/util/constants.dart';

class AboutScreen extends StatefulWidget {
  static String id = kIdAboutScreen;

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text(
              'About Tank Mates',
              style: kTextStyleLarge,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Contributing - Github page or email link for issues',
            style: kTextStyleSmall,
          ),
          Divider(),
          Text(
            'About Author - Blurb about me and link to website',
            style: kTextStyleSmall,
          ),
          Divider(),
          Text(
            'Support the app - Rate, leave feedback, share, donate',
            style: kTextStyleSmall,
          ),
          Divider(),
        ],
      ),
    );
  }
}
