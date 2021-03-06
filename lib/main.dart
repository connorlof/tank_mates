import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';
import 'package:tank_mates/bloc/edit_tank_view_model.dart';
import 'package:tank_mates/data/persistence/hive/SettingsRecord.dart';
import 'package:tank_mates/data/persistence/hive/SpeciesRecord.dart';
import 'package:tank_mates/data/persistence/hive/TankRecord.dart';
import 'package:tank_mates/data/persistence/hive/hive_constants.dart';
import 'package:tank_mates/ui/screens/about_screen.dart';
import 'package:tank_mates/ui/screens/edit_tank_screen.dart';
import 'package:tank_mates/ui/screens/loading_screen.dart';
import 'package:tank_mates/ui/screens/saved_tanks_screen.dart';
import 'package:tank_mates/ui/screens/settings_screen.dart';
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

  await Hive.openBox(kTankTableKey);
}

class TankMatesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Action bar color
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: kBackGroundColor));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EditTankViewModel()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: kBackGroundColor,
            secondaryHeaderColor: kPrimaryColor,
            accentColor: kPrimaryColor,
            scaffoldBackgroundColor: kBackGroundColor,
            primaryTextTheme: TextTheme(
                headline6: TextStyle(
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
