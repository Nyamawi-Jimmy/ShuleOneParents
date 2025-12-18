import 'package:flutter/material.dart';

class GoalCard extends StatefulWidget {
  final String title;               // e.g. "Car goal"
  final double percentage;          // e.g. 0.0
  final String savedAmount;         // e.g. "0"
  final String targetAmount;        // e.g. "0"
  final String backgroundImage;     // e.g. "assets/images/sign.jpg"

  const GoalCard({
    super.key,
    required this.title,
    required this.percentage,
    required this.savedAmount,
    required this.targetAmount,
    required this.backgroundImage,
  });

  @override
  State<GoalCard> createState() => _GoalCardState();
}

class _GoalCardState extends State<GoalCard> {
  bool _hidden = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            /// BACKGROUND IMAGE
            Positioned.fill(
              child: Opacity(
                opacity: 1,
                child: Image.asset(
                  widget.backgroundImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// CONTENT OVERLAY
            Container(
              padding: const EdgeInsets.all(16),
              color: theme.colorScheme.background.withOpacity(0.70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  /// TOP ROW: % + title + icon + eye
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Percentage (hidden or shown)
                          Text(
                            _hidden ? "•••" : "${widget.percentage.toStringAsFixed(1)}%",
                            style: theme.textTheme.bodyMedium?.copyWith(
                            ),
                          ),
                          const SizedBox(width: 6),

                          // Goal name
                          Text(
                            widget.title,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),

                          Icon(Icons.account_balance_wallet,
                              color: theme.primaryColor),
                        ],
                      ),

                      /// Eye toggle
                    ],
                  ),

                  const Divider(color: Colors.grey),

                  /// BOTTOM ROW: Amount saved + total
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Amount Saved (KES)"),
                          IconButton(
                            onPressed: () => setState(() => _hidden = !_hidden),
                            icon: Icon(
                              _hidden ? Icons.visibility_off : Icons.visibility,
                            ),
                          ),

                        ],
                      ),

                      Text(
                        _hidden
                            ? "••• of •••"
                            : "${widget.savedAmount} of ${widget.targetAmount}",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
