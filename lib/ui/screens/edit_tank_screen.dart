import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tank_mates/bloc/edit_tank_view_model.dart';
import 'package:tank_mates/bloc/fish_comparator.dart';
import 'package:tank_mates/data/model/species.dart';
import 'package:tank_mates/data/model/tank.dart';
import 'package:tank_mates/ui/screens/about_screen.dart';
import 'package:tank_mates/ui/screens/add_fish_screen.dart';
import 'package:tank_mates/ui/screens/tank_settings_screen.dart';
import 'package:tank_mates/ui/widgets/card_button.dart';
import 'package:tank_mates/ui/widgets/menu_bar.dart';
import 'package:tank_mates/ui/widgets/parameter_tile.dart';
import 'package:tank_mates/ui/widgets/recommendation_card.dart';
import 'package:tank_mates/ui/widgets/small_card_button.dart';
import 'package:tank_mates/util/constants.dart';

class EditTankScreen extends StatefulWidget {
  EditTankScreen({this.fishObjs});

  static String id = kIdEditTankScreen;
  final List<Species> fishObjs;

  @override
  _EditTankScreenState createState() => _EditTankScreenState();
}

class _EditTankScreenState extends State<EditTankScreen> {
  AppBarChoice _topBarIndex = appBarChoices[0]; // The app's "state".

  FishComparator fishComparator = FishComparator();
  List<String> fishAvailableList = <String>[];
  List<Species> addedFish = [];

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
                                              Provider.of<EditTankViewModel>(
                                                      context)
                                                  .tankState
                                                  .tempMin
                                                  .toDouble(),
                                              Provider.of<EditTankViewModel>(
                                                      context)
                                                  .tankState
                                                  .tempMax
                                                  .toDouble()) &&
                                          Provider.of<EditTankViewModel>(
                                                      context)
                                                  .numFish >
                                              0
                                      ? '${Provider.of<EditTankViewModel>(context).tankState.tempMin} - '
                                          '${Provider.of<EditTankViewModel>(context).tankState.tempMax}°F'
                                      : '?? - ??',
                                ),
                                ParameterTile(
                                  label: 'pH',
                                  value: isValueValid(
                                              Provider.of<EditTankViewModel>(
                                                      context)
                                                  .tankState
                                                  .phMin,
                                              Provider.of<EditTankViewModel>(
                                                      context)
                                                  .tankState
                                                  .phMax) &&
                                          Provider.of<EditTankViewModel>(
                                                      context)
                                                  .numFish >
                                              0
                                      ? '${Provider.of<EditTankViewModel>(context).tankState.phMin} - '
                                          '${Provider.of<EditTankViewModel>(context).tankState.phMax}°F'
                                      : '?? - ??',
                                ),
                                ParameterTile(
                                  label: 'Hardness',
                                  value: isValueValid(
                                              Provider.of<EditTankViewModel>(
                                                      context)
                                                  .tankState
                                                  .hardnessMin
                                                  .toDouble(),
                                              Provider.of<EditTankViewModel>(
                                                      context)
                                                  .tankState
                                                  .hardnessMax
                                                  .toDouble()) &&
                                          Provider.of<EditTankViewModel>(
                                                      context)
                                                  .numFish >
                                              0
                                      ? '${Provider.of<EditTankViewModel>(context).tankState.hardnessMin} - '
                                          '${Provider.of<EditTankViewModel>(context).tankState.hardnessMax} dKH'
                                      : '?? - ??',
                                ),
                                ParameterTile(
                                  label: 'Care Level',
                                  value:
                                      '${toBeginningOfSentenceCase(Provider.of<EditTankViewModel>(context).tankState.careLevel.toString().split('.').last)}',
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
                                      '${toBeginningOfSentenceCase(Provider.of<EditTankViewModel>(context).tankState.status.toString().split('.').last)}',
                                  value:
                                      '${Provider.of<EditTankViewModel>(context).tankState.percentFilled} %',
                                ),
                                Text(
                                  '${Provider.of<EditTankViewModel>(context).tankState.gallons} gallon aquarium',
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
                                '${Provider.of<EditTankViewModel>(context).numFish} fish added',
                                style: kTextStyleHeader,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Consumer<EditTankViewModel>(
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
                                    return Slidable(
                                      actionPane: SlidableDrawerActionPane(),
                                      secondaryActions: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(
                                            top: 15.0,
                                          ),
                                          child: IconSlideAction(
                                            foregroundColor: kPrimaryColor,
                                            color: kBackGroundColor,
                                            icon: Icons.delete,
                                            onTap: () =>
                                                Provider.of<EditTankViewModel>(
                                                        context,
                                                        listen: false)
                                                    .removeFish(fish),
                                          ),
                                        )
                                      ],
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Divider(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0),
                                            child: Text(
                                              '$fish',
                                              style: kTextStyleSmall,
                                            ),
                                          ),
                                        ],
                                      ),
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
                                onTap: () async {
                                  final database = Hive.box("tanks");

                                  List<Tank> tanksInDb = database.values;
                                  int currentId =
                                      Provider.of<EditTankViewModel>(context,
                                              listen: false)
                                          .id;

                                  final tank = Tank(
                                      currentId,
                                      Provider.of<EditTankViewModel>(context,
                                              listen: false)
                                          .tankState
                                          .tankName,
                                      Provider.of<EditTankViewModel>(context,
                                              listen: false)
                                          .tankState
                                          .gallons,
                                      []
                                      // TODO: Pass actual species
                                      // Provider.of<EditTankViewModel>(context,
                                      //         listen: false)
                                      //     .addedFishNames,
                                      );

                                  database.put(tank.id, tank);
                                },
                              ),
                            ),
                            Expanded(
                              child: SmallCardButton(
                                icon: Icons.refresh,
                                leftMargin: 5.0,
                                rightMargin: 15.0,
                                onTap: () {
                                  Provider.of<EditTankViewModel>(context,
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
