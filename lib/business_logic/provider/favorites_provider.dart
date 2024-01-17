import 'package:flutter/material.dart';
import 'package:tourist_guide_app/data/model/trip.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Trip> _favoriteTrips = [];

  addFavoriteTrips(Trip trip) {
    _favoriteTrips.add(trip);
    notifyListeners();
  }

  deleteFavoriteTrip(Trip trip) {
    _favoriteTrips.remove(trip);
    notifyListeners();
  }

  List<Trip> get favoriteTrips => _favoriteTrips;
}
