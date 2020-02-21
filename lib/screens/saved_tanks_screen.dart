import 'package:flutter/material.dart';
import 'package:tank_mates/util/constants.dart';
import 'package:tank_mates/widgets/menu_bar.dart';

class SavedTanksScreen extends StatefulWidget {
  static String id = kIdSavedTanksScreen;

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
        automaticallyImplyLeading: false,
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
          MenuBar(false),
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${savedTankList[index]}',
                            style: kTextStyleLarge,
                          ),
                          Text(
                            '24 fish - x2 Angelfish, x6 Clown L...',
                            style: kTextStyleSmall,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Overstocked (143 %)',
                            style: kTextStyleSmall,
                          ),
                        ),
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

//class MenuBar extends StatelessWidget {
//  const MenuBar({
//    Key key,
//  }) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      color: kPrimaryColor,
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          Padding(
//            padding: const EdgeInsets.all(4.0),
//            child: ButtonTheme(
//              minWidth: 160.0,
//              child: RaisedButton(
//                onPressed: () {
//                  Navigator.pop(context);
//                },
//                child: Text(
//                  'New Tank',
//                  style: TextStyle(color: kBackGroundColor),
//                ),
//                color: kPrimaryColor,
//                shape: RoundedRectangleBorder(
//                  side: BorderSide(color: kBackGroundColor),
//                  borderRadius: BorderRadius.circular(30.0),
//                ),
//              ),
//            ),
//          ),
//          Padding(
//            padding: const EdgeInsets.all(4.0),
//            child: ButtonTheme(
//              minWidth: 160.0,
//              child: RaisedButton(
//                onPressed: () {},
//                child: Text(
//                  'Saved Tanks',
//                  style: TextStyle(color: kPrimaryColor),
//                ),
//                color: kBackGroundColor,
//                shape: RoundedRectangleBorder(
//                  side: BorderSide(color: kBackGroundColor),
//                  borderRadius: BorderRadius.circular(30.0),
//                ),
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
