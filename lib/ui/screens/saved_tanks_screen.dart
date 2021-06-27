import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tank_mates/data/model/tank.dart';
import 'package:tank_mates/data/persistence/hive/TankRecord.dart';
import 'package:tank_mates/ui/screens/about_screen.dart';
import 'package:tank_mates/ui/widgets/menu_bar.dart';
import 'package:tank_mates/util/constants.dart';

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

Widget _buildTankList(BuildContext context) {
  return WatchBoxBuilder(
    box: Hive.box('tanks'),
    builder: (context, tanksBox) {
      return ListView.builder(
        itemCount: tanksBox.length,
        padding: const EdgeInsets.all(15.0),
        itemBuilder: (BuildContext context, int index) {
          final tankRecord = tanksBox.getAt(index) as TankRecord;
          final tankItem = tankRecord.toModel();
          return _buildListItem(tankItem, tanksBox, context);
        },
      );
    },
  );
}

Widget _buildListItem(Tank itemTank, Box database, BuildContext context) {
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
          onTap: () => database.deleteAt(itemTank.id),
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
                  itemTank.species.length < 25
                      ? '${itemTank.species.length} fish - ${itemTank.species.join(",").substring(0, itemTank.species.length - 1).replaceAll('[', '').replaceAll(']', '')}'
                      : '${itemTank.species.length} fish - ${itemTank.species.join(",").substring(0, 25).replaceAll('[', '').replaceAll(']', '')}...',
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
