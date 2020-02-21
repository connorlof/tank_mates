import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tank_mates/screens/edit_tank_screen.dart';
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

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return EditTankScreen(
        fishData: fishData,
      );
    }));
  }
}
