import 'package:flutter/material.dart';
import 'package:tank_mates/screens/saved_tanks_screen.dart';
import 'package:tank_mates/util/constants.dart';
import 'package:tank_mates/widgets/parameter_tile.dart';

class EditTankScreen extends StatefulWidget {
  static String id = 'edit_tank_screen';

  @override
  _EditTankScreenState createState() => _EditTankScreenState();
}

class _EditTankScreenState extends State<EditTankScreen> {
  AppBarChoice _topBarIndex = appBarChoices[0]; // The app's "state".
  List<String> detailedResults = [
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
    if (choice.title == 'Saved Tanks') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SavedTanksScreen()));
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
      body: Row(
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
                          style: kParameterLabelTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "- Upgrade tank to at least 55 gallons",
                          style: kParameterLabelTextStyle,
                        ),
                        Text(
                          "- Remove x1 rainbow shark",
                          style: kParameterLabelTextStyle,
                        ),
                        Text(
                          "- Remove x1 molly",
                          style: kParameterLabelTextStyle,
                        ),
                        Text(
                          "- Perform 20% water changes weekly",
                          style: kParameterLabelTextStyle,
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
                        label: 'Tank Status',
                        value: 'Good',
                      ),
                      Text(
                        "45 gallon aquarium",
                        style: kParameterLabelTextStyle,
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
                        style: kParameterLabelTextStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(15.0),
                      itemCount: detailedResults.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 30.0,
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.0,
                          ),
                          margin: EdgeInsets.only(
                            bottom: 5.0,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: kCardColor,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            '${detailedResults[index]}',
                            style: kParameterLabelTextStyle,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
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
                    color: Colors.grey.shade50,
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
                            color: kCardColor,
                          ),
                          color: kCardColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Icon(
                          Icons.settings,
                          size: 24.0,
                          color: Colors.grey.shade50,
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
                            color: kCardColor,
                          ),
                          color: kCardColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Icon(
                          Icons.save,
                          size: 24.0,
                          color: Colors.grey.shade50,
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
    );
  }
}