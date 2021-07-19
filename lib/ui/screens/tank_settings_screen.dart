import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tank_mates/bloc/edit_tank_view_model.dart';
import 'package:tank_mates/ui/widgets/parameter_tile.dart';
import 'package:tank_mates/ui/widgets/round_icon_button.dart';
import 'package:tank_mates/util/constants.dart';

class TankSettingsScreen extends StatefulWidget {
  @override
  _TankSettingsScreenState createState() => _TankSettingsScreenState();
}

class _TankSettingsScreenState extends State<TankSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<EditTankViewModel>(context).tankState;
    final viewModel = Provider.of<EditTankViewModel>(context, listen: false);

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: kBackGroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Tank Settings',
              textAlign: TextAlign.center,
              style: kTextStyleHeader,
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Tank Name',
                    style: kTextStyleSmall,
                  ),
                  TextField(
                    controller: TextEditingController(
                      text: '${state.tankName}',
                    ),
                    style: kTextStyleLarge,
                    autofocus: false,
                    textAlign: TextAlign.start,
                    onChanged: (newText) {
                      viewModel.setTankName(newText);
                    },
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ParameterTile(
                    label: 'Gallons',
                    value: '${state.gallons}',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(
                        icon: Icons.remove,
                        onPressed: () {
                          viewModel.decrementTankGallons();
                        },
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      RoundIconButton(
                        icon: Icons.add,
                        onPressed: () {
                          viewModel.incrementTankGallons();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TextButton(
              child: Text(
                'Return To Edit Tank',
                style: TextStyle(
                  color: kBackGroundColor,
                  fontFamily: 'Oswald',
                  fontSize: 18.0,
                ),
              ),
              style: TextButton.styleFrom(backgroundColor: kPrimaryColor),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
