import 'package:flutter/material.dart';
import 'package:blablacaar/ui/theme/theme.dart';

class BlaSwitchButton extends StatelessWidget {
  final VoidCallback onTap;

  const BlaSwitchButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(Icons.swap_vert, color: BlaColors.neutralLight),
    );
  }
}
