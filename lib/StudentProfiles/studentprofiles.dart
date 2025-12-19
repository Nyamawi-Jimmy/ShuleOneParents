import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Routes/routes.dart';

class Studentprofiles extends StatefulWidget {
  const Studentprofiles({super.key});

  @override
  State<Studentprofiles> createState() => _StudentprofilesState();
}

class _StudentprofilesState extends State<Studentprofiles> {
  final List<Learner> learners = [
    Learner(
      name: "Brian Otieno",
      grade: "Grade 6",
      avatar: "assets/images/shuleone.png",
      isActive: true,
    ),
    Learner(
      name: "Mary Wanjiku",
      grade: "Grade 4",
      avatar: "assets/images/shuleone.png",
      isActive: false,
    ),
    Learner(
      name: "Kevin Mwangi",
      grade: "Grade 7",
      avatar: "assets/images/shuleone.png",
      isActive: true,
    ),
    Learner(
      name: "Brian Otieno",
      grade: "Grade 6",
      avatar: "assets/images/shuleone.png",
      isActive: true,
    ),
    Learner(
      name: "Brian Otieno",
      grade: "Grade 6",
      avatar: "assets/images/shuleone.png",
      isActive: true,
    ),
    Learner(
      name: "Brian Otieno",
      grade: "Grade 6",
      avatar: "assets/images/shuleone.png",
      isActive: true,
    ),
    Learner(
      name: "Brian Otieno",
      grade: "Grade 6",
      avatar: "assets/images/shuleone.png",
      isActive: true,
    ),
    Learner(
      name: "Brian Otieno",
      grade: "Grade 6",
      avatar: "assets/images/shuleone.png",
      isActive: true,
    ),
    Learner(
      name: "Brian Otieno",
      grade: "Grade 6",
      avatar: "assets/images/shuleone.png",
      isActive: true,
    ),

  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(8, screenHeight * 0.05, 16, 10),
            color: theme.primaryColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Your Learners",
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Icon(
                          FontAwesomeIcons.computer,
                          size: 20,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Good Afternoon!",
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Jimmy 👋",
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    ClipOval(
                      child: Image.asset(
                        "assets/images/shuleone.png",
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: learners.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: learnerCard(context, learners[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget learnerCard(BuildContext context, Learner learner) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, RouteHelper.parenthomepage);
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Avatar
              CircleAvatar(
                radius: 26,
                backgroundImage: AssetImage(learner.avatar),
              ),

              const SizedBox(width: 12),

              // Name & grade
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      learner.name,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      learner.grade,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),

              // Status chip
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: learner.isActive
                      ? Colors.green.withOpacity(0.15)
                      : Colors.grey.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  learner.isActive ? "Active" : "Inactive",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: learner.isActive ? Colors.green : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class Learner {
  final String name;
  final String grade;
  final String avatar;
  final bool isActive;

  Learner({
    required this.name,
    required this.grade,
    required this.avatar,
    required this.isActive,
  });
}
