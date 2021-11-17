import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tank_mates/bloc/edit_species_view_model.dart';
import 'package:tank_mates/bloc/edit_tank_view_model.dart';
import 'package:tank_mates/data/model/species.dart';
import 'package:tank_mates/ui/widgets/parameter_tile.dart';
import 'package:tank_mates/ui/widgets/round_icon_button.dart';
import 'package:tank_mates/util/constants.dart';
import 'package:tank_mates/util/unit_conversions.dart';

class EditSpeciesScreen extends StatefulWidget {
  final Species species;
  const EditSpeciesScreen(this.species);

  @override
  _EditSpeciesScreenState createState() => _EditSpeciesScreenState();
}

class _EditSpeciesScreenState extends State<EditSpeciesScreen> {
  @override
  Widget build(BuildContext context) {
    final tankViewModel =
        Provider.of<EditTankViewModel>(context, listen: false);
    final speciesViewModel =
        Provider.of<EditSpeciesViewModel>(context, listen: false);
    final Species species = widget.species;
    int quantity = tankViewModel.quantityOfSpecies(species);

    speciesViewModel.setActiveSpecies(species);

    return Container(
      color: kModalBackgroundColor,
      child: Container(
        padding: kModalPadding,
        decoration: kModalBoxDecoration,
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
                    value: '$quantity',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(
                        icon: Icons.remove,
                        onPressed: () {
                          setState(() {
                            quantity--;
                            if (quantity < 0) quantity = 0;
                            tankViewModel.removeSpeciesOnce(species);
                          });
                        },
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      RoundIconButton(
                        icon: Icons.add,
                        onPressed: () {
                          setState(() {
                            quantity++;
                            tankViewModel.addSpecies(species);
                          });
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Text(
                      'Size',
                      style: kTextStyleSmall,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Radio(
                            value: 0,
                            groupValue:
                                speciesViewModel.activeSpecies.isAdult ? 0 : 1,
                            onChanged: (value) {
                              setState(() {
                                speciesViewModel.updateIsAdult(true);
                              });
                            },
                          ),
                          Text(
                            'Adult',
                            style: kTextStyleSmall,
                          ),
                          Radio(
                            value: 1,
                            groupValue:
                                speciesViewModel.activeSpecies.isAdult ? 0 : 1,
                            onChanged: (value) {
                              setState(() {
                                speciesViewModel.updateIsAdult(false);
                              });
                            },
                          ),
                          Text(
                            'Juvenile',
                            style: kTextStyleSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Visibility(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Text(
                        'Current Size (${speciesViewModel.activeSpecies.size.toStringAsPrecision(2)} in / ${UnitConversions.inchesToCentimeters(speciesViewModel.activeSpecies.size).round()} cm)',
                        style: kTextStyleSmall,
                      ),
                    ),
                  ],
                ),
              ),
              visible: !speciesViewModel.activeSpecies.isAdult,
            ),
            Visibility(
              child: Slider(
                value: speciesViewModel.activeSpecies.size,
                min: 0,
                max: speciesViewModel.activeSpecies.maximumAdultSize,
                divisions: 20,
                label:
                    '${speciesViewModel.activeSpecies.size.toStringAsPrecision(2)} in / ${UnitConversions.inchesToCentimeters(speciesViewModel.activeSpecies.size).round()} cm',
                onChanged: (double value) {
                  setState(() {
                    speciesViewModel.updateCurrentSize(value);
                  });
                },
              ),
              visible: !speciesViewModel.activeSpecies.isAdult,
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
                tankViewModel.updateTankState();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
