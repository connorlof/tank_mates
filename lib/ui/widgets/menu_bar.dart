import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tank_mates/bloc/active_tank_data.dart';
import 'package:tank_mates/ui/screens/saved_tanks_screen.dart';
import 'package:tank_mates/ui/widgets/round_button.dart';
import 'package:tank_mates/util/constants.dart';

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
                  title: 'Edit Tank',
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
