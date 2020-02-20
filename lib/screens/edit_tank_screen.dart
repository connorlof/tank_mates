import 'package:flutter/material.dart';
import 'package:tank_mates/screens/about_screen.dart';
import 'package:tank_mates/screens/add_fish_screen.dart';
import 'package:tank_mates/screens/saved_tanks_screen.dart';
import 'package:tank_mates/screens/settings_screen.dart';
import 'package:tank_mates/util/constants.dart';
import 'package:tank_mates/widgets/parameter_tile.dart';

class EditTankScreen extends StatefulWidget {
  static String id = kIdEditTankScreen;

  @override
  _EditTankScreenState createState() => _EditTankScreenState();
}

class _EditTankScreenState extends State<EditTankScreen> {
  AppBarChoice _topBarIndex = appBarChoices[0]; // The app's "state".
  List<String> fishAddedList = [
    'x2 Angelfish',
    'x2 Dwarf Gourami',
    'x1 Rainbow Shark',
    'x6 Clown Loach',
    'x5 False Julii Cory',
    'x9 Molly',
    'x2 Angelfish',
    'x2 Dwarf Gourami',
    'x1 Rainbow Shark',
    'x6 Clown Loach',
    'x5 False Julii Cory',
    'x9 Molly',
    'x2 Angelfish',
    'x2 Dwarf Gourami',
    'x1 Rainbow Shark',
    'x6 Clown Loach',
    'x5 False Julii Cory',
    'x9 Molly',
  ];

  void _selectTopIndex(AppBarChoice choice) {
    if (choice.id == kIdSavedTanksScreen) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SavedTanksScreen()));
    } else if (choice.id == kIdSettingsScreen) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SettingsScreen()));
    } else if (choice.id == kIdAboutScreen) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AboutScreen()));
    } else {
      setState(() {
        _topBarIndex = choice;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appName,
          style: kTextStyleHeader,
        ),
        actions: <Widget>[
          // overflow menu
          PopupMenuButton<AppBarChoice>(
            icon: Icon(
              Icons.opacity,
              color: kPrimaryColor,
            ),
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
          MenuBar(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ParameterTile(
                                label: 'Temperature',
                                value: '72 - 82°F',
                              ),
                              ParameterTile(
                                label: 'pH',
                                value: '6.0 - 7.5',
                              ),
                              ParameterTile(
                                label: 'Hardness',
                                value: '10 - 20 dKH',
                              ),
                              ParameterTile(
                                label: 'Care Level',
                                value: 'Moderate',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(15.0),
                          padding: EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: kCardColor,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Recommendations",
                                style: kTextStyleSmall,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "- Upgrade tank to at least 55 gallons",
                                style: kTextStyleSmall,
                              ),
                              Text(
                                "- Remove x1 rainbow shark",
                                style: kTextStyleSmall,
                              ),
                              Text(
                                "- Remove x1 molly",
                                style: kTextStyleSmall,
                              ),
                              Text(
                                "- Perform 20% water changes weekly",
                                style: kTextStyleSmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(15.0),
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kCardColor,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ParameterTile(
                              label: 'Tank Status: Overstocked',
                              value: '143 %',
                            ),
                            Text(
                              "45 gallon aquarium",
                              style: kTextStyleSmall,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "24 fish added",
                              style: kTextStyleHeader,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Expanded(
                          child: ListView.builder(
                            itemCount: fishAddedList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Divider(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      '${fishAddedList[index]}',
                                      style: kTextStyleSmall,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: AddFishScreen(),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 15.0,
                            right: 15.0,
                            top: 15.0,
                            bottom: 5.0,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 24.0,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: kCardColor,
                            ),
                            color: kCardColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Icon(
                            Icons.add,
                            size: 80.0,
                            color: kBackGroundColor,
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                left: 15.0,
                                right: 5.0,
                                bottom: 5.0,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: kPrimaryColor,
                                ),
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Icon(
                                Icons.settings,
                                size: 24.0,
                                color: kBackGroundColor,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                right: 15.0,
                                left: 5.0,
                                bottom: 5.0,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: kPrimaryColor,
                                ),
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Icon(
                                Icons.save,
                                size: 24.0,
                                color: kBackGroundColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuBar extends StatelessWidget {
  const MenuBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ButtonTheme(
              minWidth: 160.0,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  'New Tank',
                  style: TextStyle(color: kPrimaryColor),
                ),
                color: kBackGroundColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: kBackGroundColor),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ButtonTheme(
              minWidth: 160.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SavedTanksScreen()));
                },
                child: Text(
                  'Saved Tanks',
                  style: TextStyle(color: kBackGroundColor),
                ),
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: kBackGroundColor),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
