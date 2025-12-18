import 'package:flutter/material.dart';

class ModulesPageWidget extends StatelessWidget {
  final String title;
  final List<ModuleItem> modules;

  const ModulesPageWidget({
    super.key,
    required this.title,
    required this.modules,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            /// BACKGROUND IMAGE
            Positioned.fill(
              child: Image.asset(
                "assets/images/background.jpg",
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.75),
                colorBlendMode: BlendMode.darken,
              ),
            ),

            /// CONTENT
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// HEADER
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  /// MODULE GRID
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: modules.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      final item = modules[index];

                      return GestureDetector(
                        onTap: item.onTap,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: item.color.withOpacity(0.3),
                              ),
                              child: Icon(item.icon, color: item.color),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item.label,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
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

/// MODULE MODEL
class ModuleItem {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onTap; // new field

  ModuleItem({
    required this.icon,
    required this.label,
    required this.color,
    this.onTap,
  });
}
