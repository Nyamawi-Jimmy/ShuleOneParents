import 'package:flutter/material.dart';

class AutoLockRow extends StatelessWidget {
  const AutoLockRow({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () {
        // Show modal bottom sheet with options
        showModalBottomSheet(
          context: context,
          backgroundColor: theme.colorScheme.background,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text("1 minute"),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Auto-lock set to 1 minute")),
                    );
                  },
                ),
                ListTile(
                  title: const Text("2 minutes"),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Auto-lock set to 2 minutes")),
                    );
                  },
                ),
                ListTile(
                  title: const Text("5 minutes"),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Auto-lock set to 5 minutes")),
                    );
                  },
                ),
                ListTile(
                  title: const Text("10 minutes"),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Auto-lock set to 10 minutes")),
                    );
                  },
                ),
              ],
            );
          },
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "2 minutes",
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              "Time taken to lock the app after inactivity",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          Icon(
            Icons.timelapse_sharp,
            size: 20,
            color: theme.primaryColor,
          ),
        ],
      ),
    );
  }
}
