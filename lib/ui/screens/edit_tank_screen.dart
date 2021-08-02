import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tank_mates/bloc/edit_tank_view_model.dart';
import 'package:tank_mates/bloc/fish_comparator.dart';
import 'package:tank_mates/bloc/settings_view_model.dart';
import 'package:tank_mates/data/model/species.dart';
import 'package:tank_mates/data/model/tank_state.dart';
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
  EditTankScreen({this.speciesList});

  static String id = kIdEditTankScreen;
  final List<Species> speciesList;

  @override
  _EditTankScreenState createState() => _EditTankScreenState();
}

class _EditTankScreenState extends State<EditTankScreen> {
  AppBarChoice _topBarIndex = appBarChoices[0]; // The app's "state".

  FishComparator fishComparator = FishComparator();
  List<String> speciesAvailable = <String>[];
  List<Species> addedSpecies = [];

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    generateAvailableFishList();
    loadSettings();
  }

  void generateAvailableFishList() {
    for (int i = 0; i < widget.speciesList.length; i++) {
      speciesAvailable.add(widget.speciesList[i].name);
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

  void loadSettings() async {
    final viewModel = Provider.of<SettingsViewModel>(context, listen: false);
    await viewModel.loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    final TankState state = Provider.of<EditTankViewModel>(context).tankState;
    final EditTankViewModel viewModel =
        Provider.of<EditTankViewModel>(context, listen: false);
    final SettingsViewModel settingsViewModel =
        Provider.of<SettingsViewModel>(context);

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
                                  value: isValueValid(state.tempMin.toDouble(),
                                              state.tempMax.toDouble()) &&
                                          state.fishAdded.length > 0
                                      ? '${settingsViewModel.temperatureQuantity(state.tempMin)} - '
                                          '${settingsViewModel.temperatureQuantity(state.tempMax)} ${settingsViewModel.temperatureUnitString()}'
                                      : '?? - ??',
                                ),
                                ParameterTile(
                                  label: 'pH',
                                  value:
                                      isValueValid(state.phMin, state.phMax) &&
                                              state.fishAdded.length > 0
                                          ? '${state.phMin} - '
                                              '${state.phMax}'
                                          : '?? - ??',
                                ),
                                ParameterTile(
                                  label: 'Hardness',
                                  value: isValueValid(
                                              state.hardnessMin.toDouble(),
                                              state.hardnessMax.toDouble()) &&
                                          state.fishAdded.length > 0
                                      ? '${state.hardnessMin} - '
                                          '${state.hardnessMax} dKH'
                                      : '?? - ??',
                                ),
                                ParameterTile(
                                  label: 'Care Level',
                                  value:
                                      '${toBeginningOfSentenceCase(state.careLevel.toString().split('.').last)}',
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
                                      '${toBeginningOfSentenceCase(state.status.toString().split('.').last)}',
                                  value: '${state.percentFilled} %',
                                ),
                                Text(
                                  '${settingsViewModel.volumeQuantity(state.gallons)} ${settingsViewModel.volumeUnitString()} aquarium',
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
                                '${state.fishAdded.length} fish added',
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
                                    final species =
                                        addedFishData.addedFish[index];
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
                                                viewModel.removeFish(species),
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
                                              '${species.name}',
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
                                    data: widget.speciesList,
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
                                  viewModel.saveTank();
                                },
                              ),
                            ),
                            Expanded(
                              child: SmallCardButton(
                                icon: Icons.refresh,
                                leftMargin: 5.0,
                                rightMargin: 15.0,
                                onTap: () {
                                  viewModel.resetTank();
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
