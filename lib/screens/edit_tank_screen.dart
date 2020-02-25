import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tank_mates/models/fish.dart';
import 'package:tank_mates/models/tank_data.dart';
import 'package:tank_mates/screens/about_screen.dart';
import 'package:tank_mates/screens/add_fish_screen.dart';
import 'package:tank_mates/screens/saved_tanks_screen.dart';
import 'package:tank_mates/screens/settings_screen.dart';
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
                  child: Text(choice.title),
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
                                  value: //todo: needs validation
                                      '${Provider.of<TankData>(context).tank.tempMin} - '
                                      '${Provider.of<TankData>(context).tank.tempMax}°F',
                                ),
                                ParameterTile(
                                  label: 'pH',
                                  value: //todo: needs validation
                                      '${Provider.of<TankData>(context).tank.phMin} - '
                                      '${Provider.of<TankData>(context).tank.phMax}',
                                ),
                                ParameterTile(
                                  label: 'Hardness',
                                  value: //todo: needs validation
                                      '${Provider.of<TankData>(context).tank.hardnessMin} - '
                                      '${Provider.of<TankData>(context).tank.hardnessMax} dKH',
                                ),
                                ParameterTile(
                                  label: 'Care Level',
                                  value:
                                      '${toBeginningOfSentenceCase(Provider.of<TankData>(context).tank.careLevel.toString().split('.').last)}',
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
                                value:
                                    '${Provider.of<TankData>(context).tank.percentFilled} %',
                              ),
                              Text(
                                '${Provider.of<TankData>(context).tank.gallons} gallon aquarium',
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
                                '${Provider.of<TankData>(context).numFish} fish added',
                                style: kTextStyleHeader,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Consumer<TankData>(
                              builder: (context, addedFishData, child) {
                            if (addedFishData.addedFish.length > 0) {
                              return Expanded(
                                child: ListView.builder(
                                  itemCount: addedFishData.addedFish.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final Fish fish =
                                        addedFishData.addedFish[index];
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Divider(),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15.0),
                                          child: Text(
                                            '${fish.name}',
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
                                icon: Icons.settings,
                                leftMargin: 15.0,
                                rightMargin: 5.0,
                              ),
                            ),
                            Expanded(
                              child: SmallCardButton(
                                icon: Icons.save,
                                leftMargin: 5.0,
                                rightMargin: 15.0,
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
