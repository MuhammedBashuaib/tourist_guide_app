import "package:flutter/material.dart";

import "package:tourist_guide_app/const.dart";
import "package:tourist_guide_app/data/model/trip.dart";
import "package:tourist_guide_app/presentation/widgets/custom_row_trip.dart";

class CustomTripItem extends StatelessWidget {
  final Function()? onTap;
  final Function()? onLongPress;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;

  const CustomTripItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.tripType,
    required this.season,
    this.onLongPress,
  });

  String get seasonText {
    switch (season) {
      case Season.Winter:
        return "شتاء";
      case Season.Spring:
        return "ربيع";
      case Season.Summer:
        return "صيف";
      case Season.Autumn:
        return "خريف";
      default:
        return "غير معروف";
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.Exploration:
        return 'استكشاف';
      case TripType.Recovery:
        return 'نقاهة';
      case TripType.Activities:
        return 'انشطة';
      case TripType.Therapy:
        return 'معالجة';
      default:
        return 'غير معروف';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPress,
      onTap: onTap,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(widthScreen * .05),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widthScreen * .04),
        ),
        elevation: widthScreen * .018,
        margin: EdgeInsets.all(widthScreen * .025),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(widthScreen * .04),
                    topRight: Radius.circular(widthScreen * .04),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: heightScreen * .3,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: heightScreen * .3,
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(
                    vertical: heightScreen * .01,
                    horizontal: widthScreen * .04,
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.7),
                    ],
                    stops: const [
                      0.6,
                      1,
                    ],
                  )),
                  child: Text(
                    title,
                    // ignore: deprecated_member_use
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.fade,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: heightScreen * .02,
                horizontal: widthScreen * .03,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRowTrip(
                    icon: Icons.today,
                    text: "$duration أيام",
                  ),
                  CustomRowTrip(
                    icon: Icons.wb_sunny,
                    text: seasonText,
                  ),
                  CustomRowTrip(
                    icon: Icons.family_restroom,
                    text: tripTypeText,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
