import 'package:flutter/material.dart';

class BalanceCardWidget extends StatefulWidget {
  const BalanceCardWidget({super.key});

  @override
  State<BalanceCardWidget> createState() => _BalanceCardWidgetState();
}

class _BalanceCardWidgetState extends State<BalanceCardWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 90,
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
            // Background image
            Positioned.fill(
              child: Opacity(
                opacity: 0.45,
                child: Image.asset(
                  "assets/images/background.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Content
            Container(
              padding: const EdgeInsets.all(8),
              color: theme.colorScheme.background.withOpacity(0.7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// TOP ROW
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left: Balance info
                      Row(
                        children: [
                          Icon(
                            Icons.account_balance_wallet,
                            color: theme.primaryColor,
                            size: 28,
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Fee Balance",
                                style: theme.textTheme.bodyMedium,
                              ),
                              Text(
                                "15,456 KES",
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: theme.primaryColor,
                                ),
                              ),
                              Text(
                                "Term 1 2026",
                                style: theme.textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Right: Action menu (NO selected value shown)
                      PopupMenuButton<String>(
                        icon: Icon(
                          Icons.more_vert,
                          color: theme.primaryColor,
                        ),
                        onSelected: (value) {
                          switch (value) {
                            case 'statement':
                              debugPrint("Open Fee Statement");
                              break;
                            case 'receipt':
                              debugPrint("Open Previous Fee Receipts");
                              break;
                            case 'payment':
                              debugPrint("Navigate to Make Payment");
                              break;
                          }
                        },
                        itemBuilder: (context) => const [
                          PopupMenuItem(
                            value: 'statement',
                            child: Text("Fee Statement"),
                          ),
                          PopupMenuItem(
                            value: 'receipt',
                            child: Text("Previous Fee Receipt"),
                          ),
                          PopupMenuDivider(),
                          PopupMenuItem(
                            value: 'payment',
                            child: Text("Make Payment"),
                          ),
                        ],
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
