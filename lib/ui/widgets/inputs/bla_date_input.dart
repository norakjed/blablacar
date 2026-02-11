import 'package:flutter/material.dart';
import 'package:blablacaar/utils/date_time_util.dart';
import 'package:blablacaar/ui/theme/theme.dart';

class BlaDateTile extends StatelessWidget {
  final DateTime date;
  final VoidCallback onTap;

  const BlaDateTile({super.key, required this.date, required this.onTap});

  String get formatDate => DateTimeUtils.formatDateTime(date);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(Icons.calendar_month, color: BlaColors.iconLight),
      title: Text(
        formatDate,
        style: BlaTextStyles.button.copyWith(color: BlaColors.neutralLight),
      ),
    );
  }
}
