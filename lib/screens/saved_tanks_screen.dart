import 'package:flutter/material.dart';
import 'package:tank_mates/util/constants.dart';
import 'package:tank_mates/widgets/round_button.dart';

class SavedTanksScreen extends StatefulWidget {
  static String id = 'saved_tanks_screen';

  @override
  _SavedTanksScreenState createState() => _SavedTanksScreenState();
}

class _SavedTanksScreenState extends State<SavedTanksScreen> {
  AppBarChoice _topBarIndex = appBarChoices[0]; // The app's "state".
  List<String> savedTankList = [
    'Tank #1',
    'Tank #2',
    'Tank #3',
    'Tank #4',
    'Tank #5',
    'Tank #6',
    'Tank #7',
    'Tank #8',
    'Tank #9',
    'Tank #10',
    'Tank #11',
    'Tank #12',
  ];

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
        children: <Widget>[
          Container(
            color: Colors.blueGrey.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundButton(
                  color: Colors.lightBlue,
                  title: 'New Tank',
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                RoundButton(
                  color: Colors.white,
                  title: 'Saved Tanks',
                  textColor: Colors.lightBlue,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(15.0),
              itemCount: savedTankList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  margin: EdgeInsets.only(
                    bottom: 10.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: kCardColor,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${savedTankList[index]}',
                            style: kParameterValueTextStyle,
                          ),
                          Text(
                            '24 fish - x2 Angelfish, x6 Clow...',
                            style: kParameterLabelTextStyle,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.check,
                            size: 40.0,
                            color: Color(0xFF8D8E98),
                          ),
                          Text(
                            'Good',
                            style: kParameterLabelTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
