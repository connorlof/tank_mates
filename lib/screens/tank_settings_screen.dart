import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tank_mates/provider/tank_data.dart';
import 'package:tank_mates/util/constants.dart';
import 'package:tank_mates/widgets/parameter_tile.dart';
import 'package:tank_mates/widgets/round_icon_button.dart';

class TankSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      text: '${Provider.of<TankData>(context).tank.tankName}',
                    ),
                    style: kTextStyleLarge,
                    autofocus: true,
                    textAlign: TextAlign.start,
                    onChanged: (newText) {
                      Provider.of<TankData>(context, listen: false)
                          .setTankName(newText);
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
                    value: '${Provider.of<TankData>(context).tank.gallons}',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(
                        icon: Icons.remove,
                        onPressed: () {
                          Provider.of<TankData>(context, listen: false)
                              .decrementTankGallons();
                        },
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      RoundIconButton(
                        icon: Icons.add,
                        onPressed: () {
                          Provider.of<TankData>(context, listen: false)
                              .incrementTankGallons();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Save to Device',
                    style: kTextStyleSmall,
                  ),
                  Checkbox(
                    value: false,
                    onChanged: (bool value) {},
                  ),
                ],
              ),
            ),
            FlatButton(
              child: Text(
                'Save',
                style: TextStyle(
                  color: kBackGroundColor,
                  fontFamily: 'Oswald',
                  fontSize: 18.0,
                ),
              ),
              color: kPrimaryColor,
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
