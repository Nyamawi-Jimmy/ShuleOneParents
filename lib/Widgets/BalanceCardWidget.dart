import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../Models/StudentFeeBAlanceMOdel.dart';
import '../StudentControllers/MainExamsController.dart';
import '../StudentControllers/StudentFeeBAlanceController.dart';

class BalanceCardWidget extends StatefulWidget {
  const BalanceCardWidget({super.key});

  @override
  State<BalanceCardWidget> createState() => _BalanceCardWidgetState();
}

class _BalanceCardWidgetState extends State<BalanceCardWidget> {
  StudentFeeBalance? _studentFeeBalance;

  @override
  void initState() {
    super.initState();
    _getstudentfeebalances();
  }

  void _getstudentfeebalances() async {
    final controller = Get.find<Studentfeebalancecontroller>();
    final response = await controller.getstudentfeebalance();

    if (response.isSuccess) {
      print("This is the balance ${response.message}");

      final List data = jsonDecode(response.message);
      if (data.isNotEmpty) {
        setState(() {
          _studentFeeBalance = StudentFeeBalance.fromJson(data[0]);
        });
      }
    }
  }

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
              child: Row(
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Fee Balance",
                            style: theme.textTheme.bodyMedium,
                          ),
                          Text(
                            _studentFeeBalance?.bal ?? "0 KES",
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.primaryColor,
                            ),
                          ),
                          Text(
                            _studentFeeBalance?.feeClass ?? "",
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Right: Action menu
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
            ),
          ],
        ),
      ),
    );
  }
}

