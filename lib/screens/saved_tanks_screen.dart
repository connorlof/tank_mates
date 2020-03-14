import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:tank_mates/persistence/tank_database.dart';
import 'package:tank_mates/screens/about_screen.dart';
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
    if (choice.id == kIdAboutScreen) {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          MenuBar(false),
          Expanded(
            child: _buildTankList(context),
          ),
        ],
      ),
    );
  }
}

StreamBuilder<List<Tank>> _buildTankList(BuildContext context) {
  final database = Provider.of<AppDatabase>(context);
  return StreamBuilder(
    stream: database.watchAllTanks(),
    builder: (context, AsyncSnapshot<List<Tank>> snapshot) {
      final tanks = snapshot.data ?? List();

      return ListView.builder(
        itemCount: tanks.length,
        padding: const EdgeInsets.all(15.0),
        itemBuilder: (_, index) {
          final itemTask = tanks[index];
          return _buildListItem(itemTask, database, context);
        },
      );
    },
  );
}

Widget _buildListItem(
    Tank itemTank, AppDatabase database, BuildContext context) {
  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    secondaryActions: <Widget>[
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: 5.0,
        ),
        margin: EdgeInsets.only(
          bottom: 10.0,
        ),
        child: IconSlideAction(
          foregroundColor: kPrimaryColor,
          caption: 'Delete',
          color: kBackGroundColor,
          icon: Icons.delete,
          onTap: () => database.deleteTank(itemTank),
        ),
      )
    ],
    child: InkWell(
      onTap: () {
        Navigator.pop(context, itemTank);
        //Provider.of<ActiveTankData>(context).loadSavedTank(itemTank);
      },
      child: Container(
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
                  itemTank.name.length < 16
                      ? itemTank.name
                      : '${itemTank.name.substring(0, 15)}...',
                  style: kTextStyleLarge,
                ),
                Text(
                  //TODO: test and into function
                  itemTank.fishList.length < 25
                      ? '${itemTank.numFish} fish - ${itemTank.fishList.substring(0, itemTank.fishList.length - 1).replaceAll('[', '').replaceAll(']', '')}'
                      : '${itemTank.numFish} fish - ${itemTank.fishList.substring(0, 25).replaceAll('[', '').replaceAll(']', '')}...',
                  style: kTextStyleSmall,
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  '${itemTank.status.toString().split('.').last} (${itemTank.percentFilled} %)',
                  style: kTextStyleSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
