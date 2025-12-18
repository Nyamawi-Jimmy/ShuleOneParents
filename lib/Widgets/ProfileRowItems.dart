import 'package:flutter/material.dart';

class Profilerowitems extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final double spacing;
  final VoidCallback? onTap;

  const Profilerowitems({
    super.key,
    required this.title,
    this.leadingIcon = Icons.arrow_forward_ios,
    this.trailingIcon = Icons.settings,
    this.spacing = 8,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            leadingIcon,
            size: 16,
            color: theme.primaryColor,
          ),
          SizedBox(width: screenWidth * 0.025),
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          Spacer(), // pushes trailing icon to the far right

          Icon(
            trailingIcon,
            size: 20,
            color: theme.primaryColor,

          ),
        ],
      ),
    );
  }
}
