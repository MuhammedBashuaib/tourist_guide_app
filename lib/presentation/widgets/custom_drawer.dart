import 'package:flutter/material.dart';

import 'package:tourist_guide_app/const.dart';
import 'package:tourist_guide_app/presentation/widgets/custom_list_tile_drawer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: heightScreen * .14,
            width: double.infinity,
            padding: EdgeInsets.only(top: heightScreen * .043),
            color: Theme.of(context).hintColor,
            alignment: Alignment.center,
            child: Text(
              "دليلك السياحي",
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(
            height: heightScreen * .02,
          ),
          CustomListTileDrawer(
            icon: Icons.card_travel,
            title: "الرحلات",
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(RoutesScreen.homeScreen);
            },
          ),
          CustomListTileDrawer(
            icon: Icons.filter_list,
            title: "الفلترة",
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(RoutesScreen.filterScreen);
            },
          ),
        ],
      ),
    );
  }
}
