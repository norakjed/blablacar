import 'package:blablacaar/ui/screens/home/view_model/home_model.dart';
import 'package:blablacaar/ui/screens/home/widgets/home_content.dart';
import 'package:blablacaar/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          HomeModel(ridePreferenceState: context.read<RidePreferenceState>()),
      child: const HomeContent(),
    );
  }
}
