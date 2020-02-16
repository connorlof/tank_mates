import 'package:flutter/material.dart';
import 'package:tank_mates/util/constants.dart';

class EditTankScreen extends StatefulWidget {
  static String id = 'edit_tank_screen';

  @override
  _EditTankScreenState createState() => _EditTankScreenState();
}

class _EditTankScreenState extends State<EditTankScreen> {
  Choice _topBarIndex = choices[0]; // The app's "state".
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

  void _selectTopIndex(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _topBarIndex = choice;
    });
  }

  int _bottomBarIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _bottomBarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
        actions: <Widget>[
          // overflow menu
          PopupMenuButton<Choice>(
            icon: Icon(Icons.opacity),
            onSelected: _selectTopIndex,
            itemBuilder: (BuildContext context) {
              return choices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text('Edit Tank'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storage),
            title: Text('Saved Tanks'),
          ),
        ],
        currentIndex: _bottomBarIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        Text(
                          'Temperature',
                          style: kParameterLabelTextStyle,
                        ),
                        Text(
                          '72 - 82°F',
                          style: kParameterValueTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'pH',
                          style: kParameterLabelTextStyle,
                        ),
                        Text(
                          '6.0 - 7.5',
                          style: kParameterValueTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Hardness',
                          style: kParameterLabelTextStyle,
                        ),
                        Text(
                          '10 - 20 dKH',
                          style: kParameterValueTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Care Level',
                          style: kParameterLabelTextStyle,
                        ),
                        Text(
                          'Moderate',
                          style: kParameterValueTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
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
                      Text(
                        "Tank Status",
                        style: kParameterLabelTextStyle,
                      ),
                      Text(
                        "Good",
                        style: kParameterValueTextStyle,
                      ),
                      SizedBox(
                        height: 10.0,
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
                          height: 20.0,
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
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        size: 80.0,
                        color: Colors.grey.shade50,
                      ),
                    ],
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
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.settings,
                              size: 24.0,
                              color: Colors.grey.shade50,
                            ),
                          ],
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
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.save,
                              size: 24.0,
                              color: Colors.grey.shade50,
                            ),
                          ],
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

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'About', icon: Icons.directions_car),
  const Choice(title: 'App Settings', icon: Icons.directions_bike),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
