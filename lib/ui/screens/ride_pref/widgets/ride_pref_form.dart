import 'package:blablacaar/ui/theme/theme.dart';
import 'package:blablacaar/ui/widgets/actions/bla_button.dart';
import 'package:blablacaar/ui/widgets/actions/bla_switch_button.dart';
import 'package:blablacaar/ui/widgets/display/bla_divider.dart';
import 'package:blablacaar/ui/widgets/inputs/bla_date_input.dart';
import 'package:blablacaar/ui/widgets/inputs/bla_location_input.dart';
import 'package:blablacaar/ui/widgets/inputs/bla_seat_input.dart';
import 'package:flutter/material.dart';

import '../../../../model/ride/locations.dart';
import '../../../../model/ride_pref/ride_pref.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    departure = widget.initRidePref?.departure;
    arrival = widget.initRidePref?.arrival;
    departureDate = DateTime.now();
    requestedSeats = 1;
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------
  void onSwitch() {
    Location? temp = departure;
    setState(() {
      departure = arrival;
      arrival = temp;
    });
  }

  // ----------------------------------
  // Validation
  // ----------------------------------
  bool get isFormValid {
    return departure != null && arrival != null && departure != arrival;
  }

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(BlaSpacings.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Departure
          BlaLocationInput(
            location: departure,
            type: LocationType.departure,
            onTap: () {},
          ),

          BlaDivider(),

          // Arrival
          BlaLocationInput(
            location: arrival,
            type: LocationType.arrival,
            switchIcon: BlaSwitchButton(onTap: onSwitch),
            onTap: () {},
          ),

          BlaDivider(),

          // Date
          BlaDateTile(date: departureDate, onTap: () {}),

          BlaDivider(),

          // Seats
          BlaSeatInput(passengerAmount: requestedSeats, onTap: () {}),

          BlaDivider(),

          // Search button
          BlaButton(
            label: 'Search',
            type: ButtonType.primary,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
