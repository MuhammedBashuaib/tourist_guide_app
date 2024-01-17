import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tourist_guide_app/business_logic/provider/favorites_provider.dart';
import 'package:tourist_guide_app/const.dart';
import 'package:tourist_guide_app/data/model/trip.dart';
import 'package:tourist_guide_app/presentation/widgets/custom_appbar_title.dart';
import 'package:tourist_guide_app/presentation/widgets/custom_listview_container.dart';
import 'package:tourist_guide_app/presentation/widgets/custom_text_title.dart';

class TripDetailScreen extends StatelessWidget {
  const TripDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Trip trip = ModalRoute.of(context)!.settings.arguments as Trip;
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBarTitle(
          appBarTitile: trip.title,
        ),
      ),
      floatingActionButton: Consumer<FavoriteProvider>(
          builder: (context, favoriteProvider, child) {
        if (favoriteProvider.favoriteTrips.contains(trip)) {
          return FloatingActionButton(
            backgroundColor: Theme.of(context).hintColor,
            child: Icon(
              Icons.delete,
              color: Colors.black,
              size: heightScreen * .03,
            ),
            onPressed: () {
              favoriteProvider.deleteFavoriteTrip(trip);
            },
          );
        } else {
          return FloatingActionButton(
            backgroundColor: Theme.of(context).hintColor,
            child: Icon(
              Icons.star,
              color: Colors.black,
              size: heightScreen * .03,
            ),
            onPressed: () {
              favoriteProvider.addFavoriteTrips(trip);
            },
          );
        }
      }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: heightScreen * .357,
              width: double.infinity,
              child: Image.network(
                trip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: heightScreen * .005,
            ),
            const CustomTextTitle(
              title: "الأنشطة",
            ),
            CustomListViewContainer(
              child: ListView.builder(
                itemCount: trip.activities.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0.3,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: heightScreen * .005,
                        horizontal: widthScreen * .035,
                      ),
                      child: Text(
                        trip.activities[index],
                        style: TextStyle(
                          fontSize: fSize * .97,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: heightScreen * .01,
            ),
            const CustomTextTitle(title: "البرنامج اليومي"),
            CustomListViewContainer(
              child: ListView.builder(
                itemCount: trip.program.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: heightScreen * .023,
                          backgroundColor: Colors.amber,
                          child: Text(
                            "${index + 1} يوم",
                            style: TextStyle(
                              fontSize: fSize * .8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          trip.program[index],
                          style: TextStyle(
                            fontSize: fSize * .97,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
