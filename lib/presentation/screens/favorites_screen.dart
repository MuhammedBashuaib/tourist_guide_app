import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tourist_guide_app/business_logic/provider/favorites_provider.dart';
import 'package:tourist_guide_app/const.dart';
import 'package:tourist_guide_app/presentation/widgets/custom_trip_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteProvider favoriteProvider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      body: favoriteProvider.favoriteTrips.length == 0
          ? Center(
              child: Text(
                "ليس لديك أي رحلة في قائمة المفضلة",
                style: TextStyle(
                  fontFamily: "ElMessiri",
                  fontSize: fSize * 1.2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : ListView.builder(
              itemCount: favoriteProvider.favoriteTrips.length,
              itemBuilder: (context, index) {
                return CustomTripItem(
                  onLongPress: () {
                    favoriteProvider.deleteFavoriteTrip(
                        favoriteProvider.favoriteTrips[index]);
                  },
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      RoutesScreen.tripDetailScreen,
                      arguments: favoriteProvider.favoriteTrips[index],
                    );
                  },
                  title: favoriteProvider.favoriteTrips[index].title,
                  imageUrl: favoriteProvider.favoriteTrips[index].imageUrl,
                  duration: favoriteProvider.favoriteTrips[index].duration,
                  tripType: favoriteProvider.favoriteTrips[index].tripType,
                  season: favoriteProvider.favoriteTrips[index].season,
                );
              },
            ),
    );
  }
}
