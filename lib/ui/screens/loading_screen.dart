import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:tank_mates/bloc/edit_tank_view_model.dart';
import 'package:tank_mates/data/json/species_json_data.dart';
import 'package:tank_mates/data/json/species_json_parser.dart';
import 'package:tank_mates/data/model/species.dart';
import 'package:tank_mates/ui/screens/edit_tank_screen.dart';
import 'package:tank_mates/util/constants.dart';

class LoadingScreen extends StatefulWidget {
  static String id = kIdLoadingScreen;

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getFishData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SpinKitDoubleBounce(
            color: kPrimaryColor,
            size: 100.0,
          ),
          Text(
            'Tank Mates',
            style: kTextStyleLarge,
          )
        ],
      ),
    );
  }

  void getFishData() async {
    final viewModel = Provider.of<EditTankViewModel>(context, listen: false);
    var fishData = await rootBundle.loadString('assets/freshwater_data.json');

    SpeciesJsonParser jsonParser = SpeciesJsonParser();

    var jsonData = jsonDecode(fishData)['freshwater_data'] as List;

    List<SpeciesJsonData> speciesJsonDataList =
        jsonData.map((tagJson) => SpeciesJsonData.fromJson(tagJson)).toList();

    var speciesList = <Species>[];

    for (int i = 0; i < speciesJsonDataList.length; i++) {
      speciesList.add(jsonParser.outputValidatedFish(speciesJsonDataList[i]));
      speciesList[i].key = speciesJsonDataList[i].scientificName;
    }

    viewModel.setAvailableFish(speciesList);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return EditTankScreen(
        fishObjs: speciesList,
      );
    }));
  }
}
