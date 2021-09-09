import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tank_mates/bloc/edit_tank_view_model.dart';
import 'package:tank_mates/util/constants.dart';

class FilterListScreen extends StatefulWidget {
  FilterListScreen();

  @override
  _FilterListScreenState createState() => _FilterListScreenState();
}

class _FilterListScreenState extends State<FilterListScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<EditTankViewModel>(context, listen: false);
    var speciesGroups = ['All'] + viewModel.speciesGroups();
    var filterIndex = viewModel.speciesFilter;

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
              'Filter by Species Group',
              textAlign: TextAlign.center,
              style: kTextStyleHeader,
            ),
            Container(
              height: 400.0,
              child: ListView.builder(
                itemCount: speciesGroups.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Divider(),
                      RadioListTile(
                        value: index,
                        groupValue: filterIndex,
                        title: Text(
                            toBeginningOfSentenceCase(speciesGroups[index])),
                        onChanged: (val) {
                          setState(() {
                            viewModel.setSpeciesFilter(val);
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
            TextButton(
              child: Text(
                'Filter',
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
