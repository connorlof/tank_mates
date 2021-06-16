import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';
import 'package:tank_mates/persistence/hive/SettingsRecord.dart';
import 'package:tank_mates/persistence/hive/SpeciesRecord.dart';
import 'package:tank_mates/persistence/hive/TankRecord.dart';
import 'package:tank_mates/persistence/tank_database.dart';
import 'package:tank_mates/provider/active_tank_data.dart';
import 'package:tank_mates/screens/about_screen.dart';
import 'package:tank_mates/screens/edit_tank_screen.dart';
import 'package:tank_mates/screens/loading_screen.dart';
import 'package:tank_mates/screens/saved_tanks_screen.dart';
import 'package:tank_mates/screens/settings_screen.dart';
import 'package:tank_mates/util/constants.dart';

void main() async {
  _initializeHiveDatabase();
  runApp(TankMatesApp());
}

void _initializeHiveDatabase() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(SettingsRecordAdapter());
  Hive.registerAdapter(SpeciesRecordAdapter());
  Hive.registerAdapter(TankRecordAdapter());
}

class TankMatesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Action bar color
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: kBackGroundColor));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ActiveTankData()),
        Provider(create: (context) => AppDatabase()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: kBackGroundColor,
            secondaryHeaderColor: kPrimaryColor,
            accentColor: kPrimaryColor,
            scaffoldBackgroundColor: kBackGroundColor,
            primaryTextTheme: TextTheme(
                title: TextStyle(
              color: kPrimaryColor,
            ))),
        initialRoute: LoadingScreen.id,
        routes: {
          LoadingScreen.id: (context) => LoadingScreen(),
          EditTankScreen.id: (context) => EditTankScreen(),
          SavedTanksScreen.id: (context) => SavedTanksScreen(),
          SettingsScreen.id: (context) => EditTankScreen(),
          AboutScreen.id: (context) => AboutScreen(),
        },
      ),
    );
  }
}
