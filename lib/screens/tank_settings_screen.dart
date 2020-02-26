import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tank_mates/models/tank_data.dart';
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
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      RoundIconButton(
                        icon: Icons.add,
                        onPressed: () {},
                      ),
                    ],
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
