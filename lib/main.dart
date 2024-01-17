import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'package:tourist_guide_app/business_logic/provider/category_provider.dart';
import 'package:tourist_guide_app/business_logic/provider/favorites_provider.dart';
import 'package:tourist_guide_app/business_logic/provider/filter_provider.dart';
import 'package:tourist_guide_app/business_logic/provider/trip_provider.dart';
import 'package:tourist_guide_app/const.dart';
import 'package:tourist_guide_app/presentation/screens/category_screen.dart';
import 'package:tourist_guide_app/presentation/screens/category_trips_screen.dart';
import 'package:tourist_guide_app/presentation/screens/favorites_screen.dart';
import 'package:tourist_guide_app/presentation/screens/filter_screen.dart';
import 'package:tourist_guide_app/presentation/screens/filter_search_screen.dart';
import 'package:tourist_guide_app/presentation/screens/home_screen.dart';
import 'package:tourist_guide_app/presentation/screens/trip_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeHWFSize(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => TripProvider()),
        ChangeNotifierProvider(create: (context) => FilterProvider()),
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
      ],
      child: MaterialApp(
        title: "Tourist guide",
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar', 'AE'),
        ],
        theme: ThemeData(
            primarySwatch: Colors.blue,
            hintColor: Colors.amber,
            //secondaryHeaderColor: Colors.amber,
            fontFamily: "ElMessiri",
            textTheme: ThemeData.light().textTheme.copyWith(
                  // ignore: deprecated_member_use
                  headline5: TextStyle(
                    color: Colors.blue,
                    fontSize: fSize * 1.53, //24
                    fontFamily: 'ElMessiri',
                    fontWeight: FontWeight.bold,
                  ),
                  // ignore: deprecated_member_use
                  headline6: TextStyle(
                    color: Colors.white,
                    fontSize: fSize * 2,
                    fontFamily: 'ElMessiri',
                    fontWeight: FontWeight.bold,
                  ),
                )),
        debugShowCheckedModeBanner: false,
        //home: const CategoryScreen(),
        routes: {
          RoutesScreen.homeScreen: (context) => const HomeScreen(),
          RoutesScreen.categoryScreen: (context) => const CategoryScreen(),
          RoutesScreen.categoryTripsScreen: (context) =>
              const CategoryTripsScreen(),
          RoutesScreen.tripDetailScreen: (context) => const TripDetailScreen(),
          RoutesScreen.favoritesScreen: (context) => const FavoritesScreen(),
          RoutesScreen.filterScreen: (context) => const FilterScreen(),
          RoutesScreen.filterSearchScreen: (context) =>
              const FilterSearchScreen(),
        },
      ),
    );
  }
}
