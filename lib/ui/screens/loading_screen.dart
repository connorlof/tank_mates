import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:tank_mates/bloc/edit_tank_view_model.dart';
import 'package:tank_mates/data/json/fish_json_podo.dart';
import 'package:tank_mates/data/json/fish_podo_parser.dart';
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
    var fishData = await rootBundle.loadString('assets/freshwater_data.json');

    FishPodoParser podoParser = FishPodoParser();

    var fishObjsJson = jsonDecode(fishData)['freshwater_data'] as List;

    List<FishJsonPodo> fishPodoObjs =
        fishObjsJson.map((tagJson) => FishJsonPodo.fromJson(tagJson)).toList();

    var fishObjs = <Species>[];

    for (int i = 0; i < fishPodoObjs.length; i++) {
      fishObjs.add(podoParser.outputValidatedFish(fishPodoObjs[i]));
    }

    Provider.of<EditTankViewModel>(
      context,
      listen: false,
    ).setAvailableFish(fishObjs);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return EditTankScreen(
        fishObjs: fishObjs,
      );
    }));
  }
}
