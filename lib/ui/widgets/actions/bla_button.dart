import 'package:flutter/material.dart';
import '../../theme/theme.dart';

enum ButtonType { primary, secondary }

class BlaButton extends StatelessWidget {
  final String label;
  final ButtonType type;
  final IconData? icon;
  final VoidCallback onPressed;

  const BlaButton({
    super.key,
    required this.label,
    required this.type,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPrimary = type == ButtonType.primary;

    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: isPrimary ? BlaColors.primary : BlaColors.white,
          foregroundColor: isPrimary ? BlaColors.white : BlaColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(BlaSpacings.radiusLarge),
            side: isPrimary
                ? BorderSide.none
                : BorderSide(color: BlaColors.primary),
          ),
        ),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (icon == null) {
      return Text(label, style: BlaTextStyles.button);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20),
        Text(label, style: BlaTextStyles.button),
      ],
    );
  }
}
