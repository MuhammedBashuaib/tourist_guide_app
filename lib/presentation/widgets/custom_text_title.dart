import 'package:flutter/material.dart';

import 'package:tourist_guide_app/const.dart';

class CustomTextTitle extends StatelessWidget {
  final String title;
  const CustomTextTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: heightScreen * .02,
        horizontal: widthScreen * .05,
      ),
      alignment: Alignment.topRight,
      child: Text(
        title,
        // ignore: deprecated_member_use
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
