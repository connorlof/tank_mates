import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tank_mates/models/fish.dart';
import 'package:tank_mates/persistence/tank_database.dart';
import 'package:tank_mates/provider/active_tank_data.dart';
import 'package:tank_mates/screens/about_screen.dart';
import 'package:tank_mates/screens/add_fish_screen.dart';
import 'package:tank_mates/screens/tank_settings_screen.dart';
import 'package:tank_mates/util/constants.dart';
import 'package:tank_mates/util/fish_comparator.dart';
import 'package:tank_mates/widgets/card_button.dart';
import 'package:tank_mates/widgets/menu_bar.dart';
import 'package:tank_mates/widgets/parameter_tile.dart';
import 'package:tank_mates/widgets/recommendation_card.dart';
import 'package:tank_mates/widgets/small_card_button.dart';

class EditTankScreen extends StatefulWidget {
  EditTankScreen({this.fishObjs});

  static String id = kIdEditTankScreen;
  final List<Fish> fishObjs;

  @override
  _EditTankScreenState createState() => _EditTankScreenState();
}

class _EditTankScreenState extends State<EditTankScreen> {
  AppBarChoice _topBarIndex = appBarChoices[0]; // The app's "state".

  FishComparator fishComparator = FishComparator();
  List<String> fishAvailableList = <String>[];
  List<Fish> addedFish = [];

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    generateAvailableFishList();
  }

  void generateAvailableFishList() {
    for (int i = 0; i < widget.fishObjs.length; i++) {
      fishAvailableList.add(widget.fishObjs[i].name);
    }
  }

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
        title: Text(
          appName,
          style: kTextStyleHeader,
        ),
        automaticallyImplyLeading: false,
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
      body: WillPopScope(
        onWillPop: () async {
          return Future.value(false);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            MenuBar(true),
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
                                  value: isValueValid(
                                              Provider.of<ActiveTankData>(
                                                      context)
                                                  .tank
                                                  .tempMin
                                                  .toDouble(),
                                              Provider.of<ActiveTankData>(
                                                      context)
                                                  .tank
                                                  .tempMax
                                                  .toDouble()) &&
                                          Provider.of<ActiveTankData>(context)
                                                  .numFish >
                                              0
                                      ? '${Provider.of<ActiveTankData>(context).tank.tempMin} - '
                                          '${Provider.of<ActiveTankData>(context).tank.tempMax}°F'
                                      : '?? - ??',
                                ),
                                ParameterTile(
                                  label: 'pH',
                                  value: isValueValid(
                                              Provider.of<ActiveTankData>(
                                                      context)
                                                  .tank
                                                  .phMin,
                                              Provider.of<ActiveTankData>(
                                                      context)
                                                  .tank
                                                  .phMax) &&
                                          Provider.of<ActiveTankData>(context)
                                                  .numFish >
                                              0
                                      ? '${Provider.of<ActiveTankData>(context).tank.phMin} - '
                                          '${Provider.of<ActiveTankData>(context).tank.phMax}°F'
                                      : '?? - ??',
                                ),
                                ParameterTile(
                                  label: 'Hardness',
                                  value: isValueValid(
                                              Provider.of<ActiveTankData>(
                                                      context)
                                                  .tank
                                                  .hardnessMin
                                                  .toDouble(),
                                              Provider.of<ActiveTankData>(
                                                      context)
                                                  .tank
                                                  .hardnessMax
                                                  .toDouble()) &&
                                          Provider.of<ActiveTankData>(context)
                                                  .numFish >
                                              0
                                      ? '${Provider.of<ActiveTankData>(context).tank.hardnessMin} - '
                                          '${Provider.of<ActiveTankData>(context).tank.hardnessMax} dKH'
                                      : '?? - ??',
                                ),
                                ParameterTile(
                                  label: 'Care Level',
                                  value:
                                      '${toBeginningOfSentenceCase(Provider.of<ActiveTankData>(context).tank.careLevel.toString().split('.').last)}',
                                ),
                              ],
                            ),
                          ),
                          RecommendationCard(),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
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
                                  child: TankSettingsScreen(),
                                ),
                              ),
                            );
                          },
                          child: Container(
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
                                  label: 'Tank Status: '
                                      '${toBeginningOfSentenceCase(Provider.of<ActiveTankData>(context).tank.status.toString().split('.').last)}',
                                  value:
                                      '${Provider.of<ActiveTankData>(context).tank.percentFilled} %',
                                ),
                                Text(
                                  '${Provider.of<ActiveTankData>(context).tank.gallons} gallon aquarium',
                                  style: kTextStyleSmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${Provider.of<ActiveTankData>(context).numFish} fish added',
                                style: kTextStyleHeader,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Consumer<ActiveTankData>(
                              builder: (context, addedFishData, child) {
                            if (addedFishData.addedFishConsolidated.length >
                                0) {
                              return Expanded(
                                child: ListView.builder(
                                  itemCount: addedFishData
                                      .addedFishConsolidated.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final String fish = addedFishData
                                        .addedFishConsolidated[index];
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Divider(),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15.0),
                                          child: Text(
                                            '$fish',
                                            style: kTextStyleSmall,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              );
                            } else {
                              return Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Divider(),
                                    ],
                                  ),
                                ),
                              );
                              ;
                            }
                          }),
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
                                  child: AddFishScreen(
                                    data: widget.fishObjs,
                                  ),
                                ),
                              ),
                            );
                          },
                          child: CardButton(),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: SmallCardButton(
                                icon: Icons.save,
                                leftMargin: 15.0,
                                rightMargin: 5.0,
                                onTap: () {
                                  final database = Provider.of<AppDatabase>(
                                      context,
                                      listen: false);

                                  final tank = Tank(
                                    name: Provider.of<ActiveTankData>(context,
                                            listen: false)
                                        .tank
                                        .tankName,
                                    gallons: Provider.of<ActiveTankData>(
                                            context,
                                            listen: false)
                                        .tank
                                        .gallons,
                                    status: Provider.of<ActiveTankData>(context,
                                            listen: false)
                                        .tank
                                        .status
                                        .toString(),
                                    aggressiveness: Provider.of<ActiveTankData>(
                                            context,
                                            listen: false)
                                        .tank
                                        .aggressiveness
                                        .toString(),
                                    phMin: Provider.of<ActiveTankData>(context,
                                            listen: false)
                                        .tank
                                        .phMin,
                                    phMax: Provider.of<ActiveTankData>(context,
                                            listen: false)
                                        .tank
                                        .phMax,
                                    tempMin: Provider.of<ActiveTankData>(
                                            context,
                                            listen: false)
                                        .tank
                                        .tempMin,
                                    tempMax: Provider.of<ActiveTankData>(
                                            context,
                                            listen: false)
                                        .tank
                                        .tempMax,
                                    hardnessMin: Provider.of<ActiveTankData>(
                                            context,
                                            listen: false)
                                        .tank
                                        .hardnessMin,
                                    hardnessMax: Provider.of<ActiveTankData>(
                                            context,
                                            listen: false)
                                        .tank
                                        .hardnessMax,
                                    careLevel: Provider.of<ActiveTankData>(
                                            context,
                                            listen: false)
                                        .tank
                                        .careLevel
                                        .toString(),
                                    percentFilled: Provider.of<ActiveTankData>(
                                            context,
                                            listen: false)
                                        .tank
                                        .percentFilled,
                                    recommendationList:
                                        Provider.of<ActiveTankData>(context,
                                                listen: false)
                                            .tank
                                            .recommendationList,
                                    fishList: Provider.of<ActiveTankData>(
                                            context,
                                            listen: false)
                                        .addedFishConsolidated
                                        .toString(),
                                    fishJson: Provider.of<ActiveTankData>(
                                            context,
                                            listen: false)
                                        .addedFishNames,
                                    numFish: 0,
                                  );
                                  database.insertTank(tank);
                                },
                              ),
                            ),
                            Expanded(
                              child: SmallCardButton(
                                icon: Icons.refresh,
                                leftMargin: 5.0,
                                rightMargin: 15.0,
                                onTap: () {
                                  Provider.of<ActiveTankData>(context,
                                          listen: false)
                                      .resetTank();
                                },
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
      ),
    );
  }
}

bool isValueValid(double minValue, double maxValue) {
  if (minValue <= maxValue) {
    return true;
  }
  return false;
}
