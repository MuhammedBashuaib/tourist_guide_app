import 'package:flutter/material.dart';

//Screen coordinates and the default size of the font
//////////////////////////////////////////////////////////////
double widthScreen = 0;
double heightScreen = 0;
double fSize = 0;

initializeHWFSize(BuildContext context) {
  widthScreen = MediaQuery.of(context).size.width;
  heightScreen = MediaQuery.of(context).size.height;
  fSize = widthScreen / 25;
}
//////////////////////////////////////////////////////////////

//Screen routes
/////////////////////////////////////////////////////////////
class RoutesScreen {
  static const String homeScreen = "/";
  static const String categoryScreen = "categoryScreen";
  static const String categoryTripsScreen = "categoryTripsScreen";
  static const String tripDetailScreen = "tripDetailScreen";
  static const String favoritesScreen = "favoritesScreen";
  static const String filterScreen = "filterScreen";
  static const String filterSearchScreen = "filterSearchScreen";
}
