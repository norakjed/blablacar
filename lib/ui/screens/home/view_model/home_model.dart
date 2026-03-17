import 'package:blablacaar/model/ride_pref/ride_pref.dart';
import 'package:blablacaar/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';

class HomeModel extends ChangeNotifier {
  final RidePreferenceState ridePreferenceState;
  RidePreference? _currentPreference;
  List<RidePreference> _history = [];

  HomeModel({required this.ridePreferenceState}) {
    ridePreferenceState.addListener(notifyListeners);

    _init();
  }

  RidePreference? get currentPreference => _currentPreference;
  List<RidePreference> get history => _history;

  void _init() {
    _currentPreference = ridePreferenceState.currentPreference;
    _history = ridePreferenceState.history;

    notifyListeners();
  }

  void selectPreference(RidePreference preference) {
    ridePreferenceState.selectPreference(preference);
  }

  @override
  void dispose() {
    ridePreferenceState.removeListener(notifyListeners);
    super.dispose();
  }
}
