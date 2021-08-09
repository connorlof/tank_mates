import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tank_mates/bloc/edit_tank_view_model.dart';
import 'package:tank_mates/data/model/species.dart';
import 'package:tank_mates/util/constants.dart';

class AddFishScreen extends StatelessWidget {
  AddFishScreen({@required this.data});

  final List<Species> data;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<EditTankViewModel>(context, listen: false);
    List<Species> activeData =
        data.where((species) => species.speciesGroup == 'angelfish').toList();

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add Fish',
                  textAlign: TextAlign.left,
                  style: kTextStyleHeader,
                ),
                GestureDetector(
                  onTap: () {
                    _showFilterDialog(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Filter',
                        textAlign: TextAlign.right,
                        style: kTextStyleSmall,
                      ),
                      SizedBox(width: 6),
                      Icon(
                        Icons.filter_list,
                        size: 32.0,
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 400.0,
              child: ListView.builder(
                itemCount: activeData.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      viewModel.addFish(activeData[index]);
                      Navigator.pop(context);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Divider(),
                        Text(
                          '${activeData[index].name}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Oswald',
                            fontSize: 18.0,
                            color: Color(0xFF3c4146),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            TextButton(
              child: Text(
                'Cancel',
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

  void _showFilterDialog(BuildContext context) {
    final viewModel = Provider.of<EditTankViewModel>(context, listen: false);
    final speciesGroups = viewModel.speciesGroups();

    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
                title: Text(
                  'Filter by Species Type',
                  textAlign: TextAlign.center,
                  style: kTextStyleHeader,
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        width: double.minPositive,
                        height: 400.0,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: speciesGroups.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Divider(),
                                CheckboxListTile(
                                  value: false,
                                  title: Text(
                                    '${speciesGroups[index]}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Oswald',
                                      fontSize: 18.0,
                                      color: Color(0xFF3c4146),
                                    ),
                                  ),
                                  onChanged: (val) {},
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    TextButton(
                      child: Text(
                        'Accept',
                        style: TextStyle(
                          color: kBackGroundColor,
                          fontFamily: 'Oswald',
                          fontSize: 18.0,
                        ),
                      ),
                      style:
                          TextButton.styleFrom(backgroundColor: kPrimaryColor),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ));
          });
        });
  }
}
