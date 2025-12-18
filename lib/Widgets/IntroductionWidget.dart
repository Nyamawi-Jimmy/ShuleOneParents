import 'package:flutter/material.dart';

class Introductionwidget extends StatelessWidget {

  const Introductionwidget({super.key,});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight*0.23, // gives bounded height (important for Stack)
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
            /// 🔹 BACKGROUND IMAGE
            Positioned.fill(
              child: Opacity(
                opacity: 0.35,
                child: Image.asset(
                  "assets/images/background.jpg", // <-- your image
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// 🔹 OVERLAY + CONTENT
            Container(
              padding: const EdgeInsets.all(8),
              color: theme.colorScheme.background.withOpacity(0.75),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/shuleone.png",
                          fit: BoxFit.cover,
                          height: 35,
                          width: 35,
                        ),
                      ),
                       SizedBox(width: screenWidth * 0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ShuleOne",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: theme.primaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Parents",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                   SizedBox(height:  screenHeight*0.02),
                  Text(
                    "ShuleOne E-Learning App",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                   SizedBox(height: screenHeight*0.02),
                  Text(
                    "Let your child join Shuleone Elearning today  to help them improve their grades.As a parent you can also monitor their progress",
                    textAlign: TextAlign.start,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
