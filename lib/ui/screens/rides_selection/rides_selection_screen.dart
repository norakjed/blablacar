import 'package:blablacaar/data/repositories/ride/ride_repository.dart';
import 'package:blablacaar/ui/screens/rides_selection/view_model/ride_selection_model.dart';
import 'package:blablacaar/ui/screens/rides_selection/widgets/ride_selection_content.dart';
import 'package:blablacaar/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RidesSelectionScreen extends StatelessWidget {
  const RidesSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RidesSelectionModel(
        ridePreferenceState: context.read<RidePreferenceState>(),
        ridesRepository: context.read<RidesRepository>(),
      ),
      child: const RidesSelectionContent(),
    );
  }
}
