import 'package:flutter/material.dart';

class ReminderWidget extends StatelessWidget {
  final String title;
  final bool value; // switch value
  final ValueChanged<bool> onChanged; // switch callback
  final IconData trailingIcon;

  const ReminderWidget({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.trailingIcon = Icons.settings,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        /// 🔵 Leading Toggle Switch
        Transform.scale(
          scale: 0.8,
          child: Switch(
            value: value,
            onChanged: onChanged,

            // Thumb color
            activeColor: Colors.white,
            inactiveThumbColor: Colors.white,

            // Track color
            activeTrackColor: theme.primaryColor.withOpacity(0.5),
            inactiveTrackColor: Colors.grey.shade400.withOpacity(0.5),

            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),

        SizedBox(width: screenWidth * 0.015),

        /// 🔵 Title
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),

        Spacer(),

        /// 🔵 Trailing icon
        Icon(
          trailingIcon,
          size: 20,
          color: theme.primaryColor,
        ),
      ],
    );
  }
}
