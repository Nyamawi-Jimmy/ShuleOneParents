import 'package:flutter/material.dart';

class Gradescardwidget extends StatelessWidget {

  const Gradescardwidget({super.key,});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight*0.09, // gives bounded height (important for Stack)
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
                opacity: 0.51,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                 Text("Mean Grade",style: theme.textTheme.titleMedium?.copyWith(
                   fontWeight: FontWeight.w500
                 ),
                 ),
                        Text("B-",style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600
                        ),)

                      ],
                    ),
                    Text("FORM 2 END TERM 3 EXAM",style: theme.textTheme.titleSmall?.copyWith(
                    )),

                  ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
