import 'package:flutter/material.dart';

import '../Models/StudentFeeBAlanceMOdel.dart';

class BalanceCardWidget extends StatelessWidget {
  final StudentFeeBalance? balance;
  final VoidCallback? onStatement;
  final VoidCallback? onReceipt;
  final VoidCallback? onPayment;

  const BalanceCardWidget({
    super.key,
    required this.balance,
    this.onStatement,
    this.onReceipt,
    this.onPayment,
  });

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
            Positioned.fill(
              child: Opacity(
                opacity: 0.45,
                child: Image.asset(
                  "assets/images/background.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: theme.colorScheme.background.withOpacity(0.7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.account_balance_wallet,
                          color: theme.primaryColor, size: 28),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Fee Balance",
                              style: theme.textTheme.bodyMedium),
                          Text(
                            balance?.bal ?? "0 KES",
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.primaryColor,
                            ),
                          ),
                          Text(balance?.feeClass ?? "",
                              style: theme.textTheme.bodySmall),
                        ],
                      ),
                    ],
                  ),
                  PopupMenuButton<String>(
                    icon: Icon(Icons.more_vert,
                        color: theme.primaryColor),
                    onSelected: (value) {
                      if (value == 'statement') onStatement?.call();
                      if (value == 'receipt') onReceipt?.call();
                      if (value == 'payment') onPayment?.call();
                    },
                    itemBuilder: (_) => const [
                      PopupMenuItem(
                          value: 'statement',
                          child: Text("Fee Statement")),
                      PopupMenuItem(
                          value: 'receipt',
                          child: Text("Previous Fee Receipt")),
                      PopupMenuDivider(),
                      PopupMenuItem(
                          value: 'payment',
                          child: Text("Make Payment")),
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


