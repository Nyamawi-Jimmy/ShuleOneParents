import 'package:flutter/material.dart';
import '../Widgets/CodeEditorCard.dart';
import '../Widgets/CodingProfileWidget.dart';
import '../Widgets/CodingProjectWidget.dart';
import '../Widgets/CodingQuizCards.dart';
import '../Widgets/CourseCardWidget.dart';
import '../Widgets/ExamActionRow.dart';

class Codingpage extends StatefulWidget {
  const Codingpage({super.key});

  @override
  State<Codingpage> createState() => _CodingpageState();
}

class _CodingpageState extends State<Codingpage> {
  Exam? selectedExam;


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
            padding: EdgeInsets.fromLTRB(8, screenHeight * 0.06, 16, 16),
            color: theme.primaryColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: screenWidth * 0.02),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "ShuleOne Academy",
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
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
          DefaultTabController(
            length: 5, // Dashboard, Assignments, Live Classes
            child: Expanded(
              child: Column(
                children: [
                  TabBar(
                    labelColor: theme.primaryColor,
                    unselectedLabelColor: theme.disabledColor,
                    indicatorColor: theme.primaryColor,
                    tabs: const [
                      Tab(text: " Courses"),
                      Tab(text: "Editor"),
                      Tab(text: "Quizez"),
                      Tab(text: "Projects"),
                      Tab(text: "Profile"),

                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // 1️⃣ Dashboard tab
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CourseCard(
                                  language: "Flutter (Dart)",
                                  description: "Build beautiful cross-platform mobile applications using Flutter and Dart.",
                                  progress: 0.65,
                                  icon: Icons.flutter_dash,
                                  onTap: () {
                                    debugPrint("Open Flutter course");
                                  },
                                ),
                                CourseCard(
                                  language: "Python",
                                  description: "Learn Python fundamentals for data science, AI, and backend development.",
                                  progress: 0.0,
                                  icon: Icons.code,
                                  onTap: () {
                                    debugPrint("Start Python course");
                                  },
                                ),
                                CourseCard(
                                  language: "JavaScript",
                                  description: "Master JavaScript for web development and interactive user interfaces.",
                                  progress: 0.32,
                                  icon: Icons.javascript,
                                  onTap: () {
                                    debugPrint("Continue JavaScript course");
                                  },
                                ),
                              ],
                            ),

                          ),
                        ),

                        // 2️⃣ Assignments tab
                        Expanded(
                          child: CodeEditorScreen(),
                        ),


                        // 3️⃣ Live Classes tab
                        SingleChildScrollView(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              CodingQuizCard(
                                language: "Dart",
                                languageIcon: Icons.flutter_dash,
                                progress: 0.0,
                                onPressed: () => debugPrint("Start Dart Quiz"),
                              ),
                              CodingQuizCard(
                                language: "Python",
                                languageIcon: Icons.memory,
                                progress: 0.45,
                                onPressed: () => debugPrint("Continue Python Quiz"),
                              ),
                              CodingQuizCard(
                                language: "JavaScript",
                                languageIcon: Icons.code,
                                progress: 1.0,
                                onPressed: () => debugPrint("Completed JavaScript Quiz"),
                              ),
                            ],
                          ),
                        ),
// Example inside a TabBarView
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                ProjectList(), // <- this includes Add button + dynamic project cards
                              ],
                            ),
                          ),
                        ),

                        SingleChildScrollView(
                          child: Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CodingProfileCard( ),

                              ],                            )
                            ,
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
