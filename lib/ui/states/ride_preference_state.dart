import 'package:blablacaar/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blablacaar/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';

class RidePreferenceState extends ChangeNotifier {
  final RidePreferencesRepository _repository;

  RidePreferenceState({required RidePreferencesRepository repository})
    : _repository = repository {
    _history = _repository.getHistory(); // immediately loads the existing history from the repository
  }

  RidePreference? _currentPreference;
  late List<RidePreference> _history;

  RidePreference? get currentPreference => _currentPreference;
  List<RidePreference> get history => _history;

  void selectPreference(RidePreference preference) {
    if (preference == _currentPreference) return;

    _currentPreference = preference;
    _repository.addPreference(preference);
    _history = _repository.getHistory();

    notifyListeners();
  }
}
