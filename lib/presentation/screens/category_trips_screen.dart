import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tourist_guide_app/business_logic/provider/trip_provider.dart';
import 'package:tourist_guide_app/const.dart';
import 'package:tourist_guide_app/presentation/widgets/custom_appbar_title.dart';
import 'package:tourist_guide_app/presentation/widgets/custom_trip_item.dart';

class CategoryTripsScreen extends StatelessWidget {
  const CategoryTripsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String? categoryId = routeArgument["id"];
    final String? categoryTitle = routeArgument["title"];
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBarTitle(
          appBarTitile: categoryTitle!,
        ),
      ),
      body: Consumer<TripProvider>(
        builder: (context, tripProvider, child) => ListView.builder(
          itemCount: tripProvider.getTripsCount(categoryId!),
          itemBuilder: (context, index) {
            return CustomTripItem(
              onTap: () {
                Navigator.of(context).pushNamed(
                  RoutesScreen.tripDetailScreen,
                  arguments: tripProvider.getAllTrips[index],
                );
              },
              title: tripProvider.getAllTrips[index].title,
              imageUrl: tripProvider.getAllTrips[index].imageUrl,
              duration: tripProvider.getAllTrips[index].duration,
              tripType: tripProvider.getAllTrips[index].tripType,
              season: tripProvider.getAllTrips[index].season,
            );
          },
        ),
      ),
    );
  }
}
