import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tourist_guide_app/business_logic/provider/filter_provider.dart';
import 'package:tourist_guide_app/const.dart';
import 'package:tourist_guide_app/presentation/widgets/custom_appbar_title.dart';
import 'package:tourist_guide_app/presentation/widgets/custom_drawer.dart';
import 'package:tourist_guide_app/presentation/widgets/custom_switch_list_tile.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(left: widthScreen * .02),
            child: Consumer<FilterProvider>(
              builder: (context, filterProvider, child) => IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    RoutesScreen.filterSearchScreen,
                    arguments: filterProvider.getFilterTrips(
                      filterProvider.changeAndGetFilters(
                        {
                          "summer": filterProvider.getIsInSummer,
                          "winter": filterProvider.getIsInWinter,
                          "familie": filterProvider.getIsFamilie,
                        },
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.search,
                  size: heightScreen * .04,
                ),
              ),
            ),
          ),
        ],
        title: const Center(
          child: CustomAppBarTitle(
            appBarTitile: "الفلترة",
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: heightScreen * .05,
                ),
                Consumer<FilterProvider>(
                  builder: (context, filterProvider, child) =>
                      CustomSwitchListTile(
                    title: "الرحلات الصيفية",
                    subTitle: "إظهار الرحلات في فصل الصيف فقط",
                    value: filterProvider.getIsInSummer,
                    onChanged: (value) {
                      filterProvider.changeInSummerValue(value);
                    },
                  ),
                ),
                Consumer<FilterProvider>(
                  builder: (context, filterProvider, child) =>
                      CustomSwitchListTile(
                    title: "الرحلات الشتوية",
                    subTitle: "إظهار الرحلات في فصل الشتاء فقط",
                    value: filterProvider.getIsInWinter,
                    onChanged: (value) {
                      filterProvider.changeInWinterValue(value);
                    },
                  ),
                ),
                Consumer<FilterProvider>(
                  builder: (context, filterProvider, child) =>
                      CustomSwitchListTile(
                    title: "الرحلات العائلية",
                    subTitle: "إظهار الرحلات العائلية فقط",
                    value: filterProvider.getIsFamilie,
                    onChanged: (value) {
                      filterProvider.changeInFamilieValue(value);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
