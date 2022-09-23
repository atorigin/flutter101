import 'package:flutter/material.dart';

Column buildButtonColumn(Color color , IconData icon , String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color
          ),
        ),
      )
    ],
  );
}


Widget buttonSection(BuildContext context) {
  return Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    buildButtonColumn(Theme.of(context).primaryColor, Icons.call, "CALL"),
    buildButtonColumn(Theme.of(context).primaryColor, Icons.near_me, "ROUTE"),
    buildButtonColumn(Theme.of(context).primaryColor, Icons.share, "SHARE")
  ],
);
}