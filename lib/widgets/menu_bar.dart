import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tank_mates/provider/active_tank_data.dart';
import 'package:tank_mates/screens/saved_tanks_screen.dart';
import 'package:tank_mates/util/constants.dart';
import 'package:tank_mates/widgets/round_button.dart';

class MenuBar extends StatelessWidget {
  MenuBar(this.isNewTank);

  final bool isNewTank;

  @override
  Widget build(BuildContext context) {
    return isNewTank
        ? Container(
            color: kPrimaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundButton(
                  isSelected: true,
                  title: 'New Tank',
                  onPressed: () {},
                ),
                RoundButton(
                  isSelected: false,
                  title: 'Saved Tanks',
                  onPressed: () async {
                    var loadedTank = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SavedTanksScreen()));

                    if (loadedTank != null) {
                      Provider.of<ActiveTankData>(context, listen: false)
                          .loadSavedTank(loadedTank);
                    }
                  },
                ),
              ],
            ),
          )
        : Container(
            color: kPrimaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundButton(
                  isSelected: false,
                  title: 'New Tank',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                RoundButton(
                  isSelected: true,
                  title: 'Saved Tanks',
                  onPressed: () {},
                ),
              ],
            ),
          );
  }
}
