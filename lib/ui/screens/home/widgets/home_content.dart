import 'package:blablacaar/ui/screens/home/view_model/home_model.dart';
import 'package:blablacaar/ui/screens/home/widgets/home_history_tile.dart';
import 'package:blablacaar/ui/widgets/pickers/bla_ride_preference_picker.dart';
import 'package:blablacaar/utils/animations_util.dart';
import 'package:blablacaar/ui/screens/rides_selection/rides_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme.dart';

const String blablaHomeImagePath = 'assets/images/blabla_home.png';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final mv = context.watch<HomeModel>();

    return Stack(
      children: [_buildBackground(), _buildForeground(context, mv)],
    );
  }

  Widget _buildForeground(BuildContext context, HomeModel mv) {
    return Column(
      children: [
        SizedBox(height: 16),
        Align(
          alignment: AlignmentGeometry.center,
          child: Text(
            "Your pick of rides at low price",
            style: BlaTextStyles.heading.copyWith(color: Colors.white),
          ),
        ),
        SizedBox(height: 100),
        Container(
          margin: EdgeInsets.symmetric(horizontal: BlaSpacings.xxl),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BlaRidePreferencePicker(
                initRidePreference: mv.currentPreference,
                onRidePreferenceSelected: (pref) async {
                  mv.selectPreference(pref);
                  await Navigator.of(context).push(
                    AnimationUtils.createBottomToTopRoute(
                      RidesSelectionScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: BlaSpacings.m),
              _buildHistory(context, mv),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHistory(BuildContext context, HomeModel mv) {
    final history = mv.history.reversed.toList();
    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: history.length,
        itemBuilder: (ctx, index) => HomeHistoryTile(
          ridePref: history[index],
          onPressed: () async {
            mv.selectPreference(history[index]);
            await Navigator.of(context).push(
              AnimationUtils.createBottomToTopRoute(RidesSelectionScreen()),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return SizedBox(
      width: double.infinity,
      height: 340,
      child: Image.asset(blablaHomeImagePath, fit: BoxFit.cover),
    );
  }
}
