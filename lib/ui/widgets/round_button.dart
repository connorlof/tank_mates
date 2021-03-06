import 'package:flutter/material.dart';
import 'package:tank_mates/util/constants.dart';

class RoundButton extends StatelessWidget {
  RoundButton({this.isSelected, this.title, @required this.onPressed});

  final bool isSelected;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ButtonTheme(
        minWidth: 160.0,
        child: RaisedButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              color: isSelected ? kPrimaryColor : kBackGroundColor,
              fontFamily: 'Oswald',
            ),
          ),
          color: isSelected ? kBackGroundColor : kPrimaryColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: kBackGroundColor),
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
