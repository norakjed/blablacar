import 'package:blablacaar/model/ride/locations.dart';
import 'package:blablacaar/ui/theme/theme.dart';
import 'package:flutter/material.dart';

enum LocationType { departure, arrival }

class BlaLocationInput extends StatelessWidget {
  final Location? location;
  final LocationType type;
  final Widget? switchIcon;
  final VoidCallback onTap;

  const BlaLocationInput({
    super.key,
    required this.location,
    required this.type,
    required this.onTap,
    this.switchIcon,
  });

  String get title =>
      "${location?.name}${type == LocationType.arrival ? ", ${location?.country.name}" : ""} ";
  String get placeHolder =>
      type == LocationType.departure ? "Leaving from" : "Going to";

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(Icons.radio_button_unchecked, color: BlaColors.iconLight),
      title: Text(
        location == null ? placeHolder : title,
        style: BlaTextStyles.button.copyWith(color: BlaColors.neutralLight),
      ),
      trailing: location == null ? null : switchIcon,
    );
  }
}
