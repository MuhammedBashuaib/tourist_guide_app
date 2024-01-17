import 'package:flutter/material.dart';
import 'package:tourist_guide_app/data/model/trip.dart';
import 'package:tourist_guide_app/data/repository/trips_data.dart';

class TripProvider extends ChangeNotifier {
  final List<Trip> _allTrips = [];

  int getTripsCount(String id) {
    _allTrips.removeRange(0, _allTrips.length);
    _allTrips.addAll(tripsData.where((trip) {
      return trip.categories.contains(id);
    }).toList());
    return _allTrips.length;
  }

  get getAllTrips => _allTrips;
}
