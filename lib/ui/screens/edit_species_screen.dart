import 'package:flutter/material.dart';
import 'package:tank_mates/data/model/species.dart';
import 'package:tank_mates/ui/widgets/parameter_tile.dart';
import 'package:tank_mates/ui/widgets/round_icon_button.dart';
import 'package:tank_mates/util/constants.dart';

class EditSpeciesScreen extends StatefulWidget {
  @override
  _EditSpeciesScreenState createState() => _EditSpeciesScreenState();
}

class _EditSpeciesScreenState extends State<EditSpeciesScreen> {
  @override
  Widget build(BuildContext context) {
    Species species = Species(
        "Tetraodon abei",
        "Abei Puffer",
        "Tetraodon abei",
        "puffer",
        Aggressiveness.aggressive,
        6.0,
        7.8,
        73,
        81,
        3,
        15,
        CareLevel.moderate,
        4,
        Diet.carnivore,
        20);

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
              'Update ${species.name}',
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
                    label: 'Quantity',
                    value: '5',
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
