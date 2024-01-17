import 'package:flutter/material.dart';

import 'package:tourist_guide_app/const.dart';

class CustomRowTrip extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomRowTrip({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).hintColor,
        ),
        SizedBox(
          width: widthScreen * .025,
        ),
        Text(
          text,
        )
      ],
    );
  }
}
