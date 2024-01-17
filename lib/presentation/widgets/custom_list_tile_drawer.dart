import 'package:flutter/material.dart';

import 'package:tourist_guide_app/const.dart';

class CustomListTileDrawer extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? onTap;
  const CustomListTileDrawer({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: Colors.blue,
        size: heightScreen * .04,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: "ElMessiri",
          fontSize: fSize * 1.7,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
