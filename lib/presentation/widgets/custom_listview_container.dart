import 'package:flutter/material.dart';

import 'package:tourist_guide_app/const.dart';

class CustomListViewContainer extends StatelessWidget {
  final Widget child;
  const CustomListViewContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(widthScreen * .017),
      ),
      padding: EdgeInsets.all(widthScreen * .015),
      margin: EdgeInsets.symmetric(
        horizontal: widthScreen * .02,
      ),
      height: heightScreen * .25, //210
      child: child,
    );
  }
}
