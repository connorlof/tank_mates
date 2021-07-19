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
              'Hi there I\'m Connor, a mobile software developer living just outside of Philadelphia, PA.'
              ' I got my first taste of coding in 2014. I spent the following summer learning to create my own Android apps.',
              style: kTextStyleSmall,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'In my free time I have combined my passion for writing user friendly and functional applications with my aquarium hobby.'
              ' I created this app as both a challenge to myself while learning Flutter and'
              ' to create an aquarium stocking calculator that uses modern day design principles.'
              ' I plan to continue to work on and release regular updates on Tank Mates.',
              style: kTextStyleSmall,
            ),
            Divider(),
            Text(
              'Support Tank Mates',
              style: kTextStyleHeader,
            ),
            Text(
              'Thanks for downloading and checking out Tank Mates. Many improvements are planned for the future'
              ' but I appreciate any feedback or feature requests. If you enjoy this app or see a feature'
              ' you would like added please leave a rating for this app on the Play Store or App Store. ',
              style: kTextStyleSmall,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'If you would like to reach out to me direct with an issue or feedback send me an email at loftydev@gmail.com',
              style: kTextStyleSmall,
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
