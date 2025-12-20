import 'package:flutter/material.dart';

class StatsMiniCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData trendIcon;
  final String trendValue;
  final Color trendColor;

  const StatsMiniCard({
    super.key,
    required this.title,
    required this.value,
    required this.trendIcon,
    required this.trendValue,
    required this.trendColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width:screenWidth*0.45 ,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.disabledColor.withOpacity(0.4),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                value,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1
                ),
              ),
               SizedBox(width: 6),
              Icon(
                trendIcon,
                size: 24,
                color: trendColor,
              ),
              const SizedBox(width: 2),
              Text(
                trendValue,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: trendColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
