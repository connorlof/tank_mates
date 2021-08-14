import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tank_mates/util/constants.dart';
import 'package:url_launcher/url_launcher.dart';

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
        child: SingleChildScrollView(
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
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Hi there I\'m Connor, a mobile software developer living just outside of Philadelphia, PA.'
                          ' I got my first taste of coding in 2014. I spent the following summer learning to create my own Android apps.',
                      style: kTextStyleSmall.copyWith(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'In my free time I have combined my passion for writing user friendly and functional applications with my aquarium hobby.'
                          ' I created this app as both a challenge to myself while learning Flutter and'
                          ' to create an aquarium stocking calculator that uses modern day design principles.'
                          ' I plan to continue to work on and release regular updates on Tank Mates.',
                      style: kTextStyleSmall.copyWith(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'If you would like to find out more about my fish keeping journey follow me on ',
                      style: kTextStyleSmall.copyWith(fontSize: 20.0),
                    ),
                    TextSpan(
                      text: 'Instagram',
                      style: kTextStyleSmall.copyWith(
                        fontSize: 22.0,
                        color: kPrimaryColor,
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          launch('https://www.instagram.com/aquatic_coder/');
                        },
                    ),
                    TextSpan(
                      text: ' or ',
                      style: kTextStyleSmall.copyWith(fontSize: 20.0),
                    ),
                    TextSpan(
                      text: 'Youtube',
                      style: kTextStyleSmall.copyWith(
                        fontSize: 22.0,
                        color: kPrimaryColor,
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          launch('https://www.youtube.com/c/TheAquaticCoder');
                        },
                    ),
                  ],
                ),
              ),
              Divider(),
              Text(
                'Support Tank Mates',
                style: kTextStyleHeader,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Thanks for downloading and checking out Tank Mates. Many improvements are planned for the future'
                          ' but I appreciate any feedback or feature requests. If you enjoy this app or see a feature'
                          ' you would like added please leave a rating for this app on the ',
                      style: kTextStyleSmall.copyWith(fontSize: 20.0),
                    ),
                    TextSpan(
                      text: 'Play Store or App Store',
                      style: kTextStyleSmall.copyWith(
                        fontSize: 22.0,
                        color: kPrimaryColor,
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          launch(
                              'https://play.google.com/store/apps/details?id=com.loftydevelopment.tank_mates&hl=en_US&gl=US');
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'If you would like to reach out to me direct with an issue or feedback send me an email at ',
                      style: kTextStyleSmall.copyWith(fontSize: 20.0),
                    ),
                    TextSpan(
                      text: 'loftydev@gmail.com',
                      style: kTextStyleSmall.copyWith(
                        fontSize: 22.0,
                        color: kPrimaryColor,
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          launch('mailto:loftydev@gmail.com');
                        },
                    ),
                    TextSpan(
                      text: ' or post an issue on ',
                      style: kTextStyleSmall.copyWith(fontSize: 20.0),
                    ),
                    TextSpan(
                      text: 'Github',
                      style: kTextStyleSmall.copyWith(
                        fontSize: 22.0,
                        color: kPrimaryColor,
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          launch('https://github.com/connorlof/tank_mates/');
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Other ways to support the app can be to share it with a friend or a ',
                      style: kTextStyleSmall.copyWith(fontSize: 20.0),
                    ),
                    TextSpan(
                      text: 'small donation to help fund future development',
                      style: kTextStyleSmall.copyWith(
                        fontSize: 22.0,
                        color: kPrimaryColor,
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          launch('https://www.buymeacoffee.com/aquaticcoder');
                        },
                    ),
                  ],
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
