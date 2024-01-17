import 'package:flutter/material.dart';

import 'package:tourist_guide_app/const.dart';
import 'package:tourist_guide_app/data/model/trip.dart';
import 'package:tourist_guide_app/presentation/widgets/custom_appbar_title.dart';
import 'package:tourist_guide_app/presentation/widgets/custom_trip_item.dart';

class FilterSearchScreen extends StatelessWidget {
  //final List<Trip> filterTrips;
  const FilterSearchScreen({
    super.key,
    //required this.filterTrips,
  });

  @override
  Widget build(BuildContext context) {
    final List<Trip> filterTrips =
        ModalRoute.of(context)!.settings.arguments as List<Trip>;
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBarTitle(
          appBarTitile: "الفلترة",
        ),
      ),
      body: ListView.builder(
        itemCount: filterTrips.length,
        itemBuilder: (context, index) {
          return CustomTripItem(
            title: filterTrips[index].title,
            imageUrl: filterTrips[index].imageUrl,
            duration: filterTrips[index].duration,
            tripType: filterTrips[index].tripType,
            season: filterTrips[index].season,
            onTap: () {
              Navigator.of(context).pushNamed(
                RoutesScreen.tripDetailScreen,
                arguments: filterTrips[index],
              );
            },
          );
        },
      ),
    );
  }
}
