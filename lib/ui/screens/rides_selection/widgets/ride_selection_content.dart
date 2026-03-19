import 'package:blablacaar/model/ride_pref/ride_pref.dart';
import 'package:blablacaar/ui/screens/rides_selection/view_model/ride_selection_model.dart';
import 'package:blablacaar/ui/screens/rides_selection/widgets/ride_preference_modal.dart';
import 'package:blablacaar/ui/screens/rides_selection/widgets/rides_selection_header.dart';
import 'package:blablacaar/ui/screens/rides_selection/widgets/rides_selection_tile.dart';
import 'package:blablacaar/utils/animations_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme.dart';

class RidesSelectionContent extends StatelessWidget {
  const RidesSelectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    final mv = context.watch<RidesSelectionModel>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          children: [
            RideSelectionHeader(
              ridePreference: mv.currentPreference!,
              onBackPressed: () => Navigator.pop(context),
              onFilterPressed: () {},
              onPreferencePressed: () => _onPreferencePressed(context, mv),
            ),

            SizedBox(height: 100),

            Expanded(
              child: ListView.builder(
                itemCount: mv.matchingRides.length,
                itemBuilder: (ctx, index) => RideSelectionTile(
                  ride: mv.matchingRides[index],
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPreferencePressed(
    BuildContext context,
    RidesSelectionModel mv,
  ) async {
    RidePreference? newPreference = await Navigator.of(context)
        .push<RidePreference>(
          AnimationUtils.createRightToLeftRoute(
            RidePreferenceModal(initialPreference: mv.currentPreference!),
          ),
        );

    if (newPreference != null) {
      mv.selectPreference(newPreference);
    }
  }
}
