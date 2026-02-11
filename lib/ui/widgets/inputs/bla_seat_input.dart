import 'package:flutter/material.dart';
import 'package:blablacaar/ui/theme/theme.dart';

class BlaSeatInput extends StatelessWidget {
  final int passengerAmount;
  final VoidCallback onTap;
  
  const BlaSeatInput({
    super.key,
    required this.passengerAmount,
    required this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(Icons.person, color: BlaColors.iconLight),
      title: Text(
        passengerAmount.toString(),
        style: BlaTextStyles.button.copyWith(color: BlaColors.neutralLight),
      ),
    );
  }
}
