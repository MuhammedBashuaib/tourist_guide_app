import 'package:flutter/material.dart';
import 'package:tourist_guide_app/data/model/trip.dart';
import 'package:tourist_guide_app/data/repository/trips_data.dart';

class FilterProvider extends ChangeNotifier {
  bool _isInSummer = false;
  bool _isInWinter = false;
  bool _isFamilie = false;
  List<Trip> _filterTrips = [];

  Map<String, bool> _filters = {
    "summer": false,
    "winter": false,
    "familie": false,
  };

  Map<String, bool> changeAndGetFilters(Map<String, bool> filterData) {
    _filters = filterData;
    //print(_filters);
    notifyListeners();
    return _filters;
  }

  List<Trip> getFilterTrips(Map<String, bool> filterData) {
    _filterTrips = tripsData.where((trip) {
      if (_filters["summer"] == true && trip.isInSummer != true) {
        return false;
      }
      if (_filters["winter"] == true && trip.isInWinter != true) {
        return false;
      }
      if (_filters["familie"] == true && trip.isForFamilies != true) {
        return false;
      }
      return true;
    }).toList();
    return _filterTrips;
  }

  void changeInSummerValue(bool value) {
    _isInSummer = value;
    notifyListeners();
  }

  void changeInWinterValue(bool value) {
    _isInWinter = value;
    notifyListeners();
  }

  void changeInFamilieValue(bool value) {
    _isFamilie = value;
    notifyListeners();
  }

  get getIsInSummer => _isInSummer;
  get getIsInWinter => _isInWinter;
  get getIsFamilie => _isFamilie;
}
