import 'package:flutter/material.dart';
import 'package:tank_mates/util/constants.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: kCardColor,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Recommendations",
            style: kTextStyleSmall,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "- Upgrade tank to at least 55 gallons",
            style: kTextStyleSmall,
          ),
          Text(
            "- Remove x1 rainbow shark",
            style: kTextStyleSmall,
          ),
          Text(
            "- Remove x1 molly",
            style: kTextStyleSmall,
          ),
          Text(
            "- Perform 20% water changes weekly",
            style: kTextStyleSmall,
          ),
        ],
      ),
    );
  }
}
