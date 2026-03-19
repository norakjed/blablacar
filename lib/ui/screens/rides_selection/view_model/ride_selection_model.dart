import 'package:blablacaar/data/repositories/ride/ride_repository.dart';
import 'package:blablacaar/model/ride/ride.dart';
import 'package:blablacaar/model/ride_pref/ride_pref.dart';
import 'package:blablacaar/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';

///
/// View model for the Ride Selection screen.
/// - Listens to RidePreferenceState for the current preference
/// - Uses RidesRepository to fetch and filter matching rides
///
class RidesSelectionModel extends ChangeNotifier {
  final RidePreferenceState ridePreferenceState;
  final RidesRepository ridesRepository;

  RidePreference? _currentPreference;
  List<Ride> _matchingRides = [];

  RidesSelectionModel({
    required this.ridePreferenceState,
    required this.ridesRepository,
  }) {
    ridePreferenceState.addListener(_onStateChanged);
    _init();
  }

  RidePreference? get currentPreference => _currentPreference;
  List<Ride> get matchingRides => _matchingRides;

  void _init() {
    _currentPreference = ridePreferenceState.currentPreference;
    _matchingRides = _computeMatchingRides();
    notifyListeners();
  }

  void _onStateChanged() {
    _currentPreference = ridePreferenceState.currentPreference;
    _matchingRides = _computeMatchingRides();
    notifyListeners();
  }

  // The view model is responsible for computing matching rides
  List<Ride> _computeMatchingRides() {
    if (_currentPreference == null) return [];

    return ridesRepository
        .getRides()
        .where(
          (ride) =>
              ride.departureLocation == _currentPreference!.departure &&
              ride.arrivalLocation == _currentPreference!.arrival &&
              ride.availableSeats >= _currentPreference!.requestedSeats,
        )
        .toList();
  }

  void selectPreference(RidePreference preference) {
    ridePreferenceState.selectPreference(preference);
  }

  @override
  void dispose() {
    ridePreferenceState.removeListener(_onStateChanged);
    super.dispose();
  }
}
