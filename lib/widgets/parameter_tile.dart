import 'package:flutter/material.dart';
import 'package:tank_mates/util/constants.dart';

class ParameterTile extends StatelessWidget {
  final String label;
  final String value;

  ParameterTile({this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: kParameterLabelTextStyle,
          ),
          Text(
            value,
            style: kParameterValueTextStyle,
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
