import 'package:blablacaar/data/repositories/location/location_repository.dart';
import 'package:blablacaar/data/repositories/location/location_repository_mock.dart';
import 'package:blablacaar/data/repositories/ride/ride_repository.dart';
import 'package:blablacaar/data/repositories/ride/ride_repository_mock.dart';
import 'package:blablacaar/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blablacaar/data/repositories/ride_preference/ride_preference_repository_mock.dart';
import 'package:blablacaar/main_common.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get devProviders {
  return [
    // Locations repository
    Provider<LocationsRepository>(create: (_) => LocationsRepositoryMock()),

    // Rides repository
    Provider<RidesRepository>(create: (_) => RidesRepositoryMock()),

    // Ride preferences repository
    Provider<RidePreferencesRepository>(
      create: (_) => RidePreferencesRepositoryMock(),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
