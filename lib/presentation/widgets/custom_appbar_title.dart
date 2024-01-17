import 'package:flutter/material.dart';

import 'package:tourist_guide_app/const.dart';

class CustomAppBarTitle extends StatelessWidget {
  final String appBarTitile;
  const CustomAppBarTitle({
    super.key,
    required this.appBarTitile,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      appBarTitile,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fSize * 1.5,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
