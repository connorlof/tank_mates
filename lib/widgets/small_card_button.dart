import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tank_mates/provider/tank_data.dart';
import 'package:tank_mates/util/constants.dart';

class SmallCardButton extends StatelessWidget {
  SmallCardButton({@required this.icon, this.leftMargin, this.rightMargin});

  final IconData icon;
  double leftMargin = 15.0;
  double rightMargin = 15.0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<TankData>(context, listen: false).resetTank();
      },
      child: Container(
        margin: EdgeInsets.only(
          right: rightMargin,
          left: leftMargin,
          bottom: 5.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: kPrimaryColor,
          ),
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Icon(
          icon,
          size: 24.0,
          color: kBackGroundColor,
        ),
      ),
    );
  }
}
