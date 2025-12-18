import 'package:flutter/material.dart';

class QuickSaveCard extends StatefulWidget {
  final String title;
  final String amount;
  final String description;

  const QuickSaveCard({
    super.key,
    required this.title,
    required this.amount,
    required this.description,
  });

  @override
  State<QuickSaveCard> createState() => _QuickSaveCardState();
}

class _QuickSaveCardState extends State<QuickSaveCard> {
  bool _isHidden = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: theme.colorScheme.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // --- Header Row ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      widget.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),

                    // 👁️ Toggle Eye Icon
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isHidden = !_isHidden;
                        });
                      },
                      child: Icon(
                        _isHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),

                // 💰 Amount (hidden or visible)
                Text(
                  _isHidden ? "•••••" : widget.amount,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            const Divider(color: Colors.white54),

            // --- Description ---
            Text(
              widget.description,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
