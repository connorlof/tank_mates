import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tank_mates/models/fish.dart';
import 'package:tank_mates/provider/tank_data.dart';
import 'package:tank_mates/util/constants.dart';

class AddFishScreen extends StatelessWidget {
  AddFishScreen({@required this.data});

  final List<Fish> data;

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
              'Add Fish',
              textAlign: TextAlign.center,
              style: kTextStyleHeader,
            ),
            Container(
              height: 400.0,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      print('adding ${data[index].name}');

                      Provider.of<TankData>(context, listen: false)
                          .addFish(data[index]);

                      Navigator.pop(context);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Divider(),
                        Text(
                          '${data[index].name}',
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
            FlatButton(
              child: Text(
                'Cancel',
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
