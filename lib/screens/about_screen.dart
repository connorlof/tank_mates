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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                'About Tank Mates',
                style: kTextStyleLarge,
              ),
            ),
            Text(
              'Developer',
              style: kTextStyleHeader,
            ),
            Text(
              'About Author - Blurb about me and link to website',
              style: kTextStyleSmall,
            ),
            Divider(),
            Text(
              'Improve Tank Mates ',
              style: kTextStyleHeader,
            ),
            Text(
              'Report an Issue/Contribute Pull request - Github issue page',
              style: kTextStyleSmall,
            ),
            Divider(),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Support Tank Mates',
              style: kTextStyleHeader,
            ),
            Text(
              'Support the app - Rate, leave feedback, share, donate',
              style: kTextStyleSmall,
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
