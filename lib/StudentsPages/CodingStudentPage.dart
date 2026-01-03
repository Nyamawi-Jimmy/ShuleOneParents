import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../Authentication/AuthControllers/ParentControler.dart';
import '../Models/CodingTopicModel.dart';
import '../ParentsPages/ParentProfilePage.dart';
import '../ParentsPages/SettingsParentPage.dart';
import '../Widgets/CodeEditorCard.dart';
import '../Widgets/CodingProfileWidget.dart';
import '../Widgets/CodingProjectWidget.dart';
import '../Widgets/CodingQuizCards.dart';
import '../Widgets/CourseCardWidget.dart';
import '../Widgets/ExamActionRow.dart';
import 'CodingTopicPage.dart';

class Codingstudentpage extends StatefulWidget {
  const Codingstudentpage({super.key});

  @override
  State<Codingstudentpage> createState() => _CodingstudentpageState();
}

class _CodingstudentpageState extends State<Codingstudentpage> {
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
                    GetBuilder<ParentController>(
                      builder: (controller) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              controller.school!.shortName,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
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
                        GetBuilder<ParentController>(
                          builder: (controller) {
                            return Text(
                              "${controller.firstName} 👋",
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'profile') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const Parentprofilepage(),
                            ),
                          );
                        } else if (value == 'settings') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const Settingsparentpage(),
                            ),
                          );
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'profile',
                          child: ListTile(
                            leading: Icon(
                              Icons.person,
                              color: theme.primaryColor,
                            ),
                            title: Text('Profile'),
                          ),
                        ),
                        PopupMenuItem(
                          value: 'settings',
                          child: ListTile(
                            leading: Icon(
                              Icons.settings,
                              color: theme.primaryColor,
                            ),
                            title: Text('Settings'),
                          ),
                        ),
                      ],
                      child: GetBuilder<ParentController>(
                        builder: (controller) {
                          return ClipOval(
                            child: Image.network(
                              controller.image,
                              fit: BoxFit.cover,
                              height: 40,
                              width: 40,
                            ),
                          );
                        },
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
                                /// PYTHON — CLOSED
                                CourseCard(
                                  language: "Python",
                                  description:
                                      "Learn Python fundamentals for data science, AI, and backend development.",
                                  progress: 0.0,
                                  icon: Icons.code,
                                  status: CourseStatus.closed,
                                  onTap: () {
                                    debugPrint("Python course is closed");
                                  },
                                ),

                                /// JAVASCRIPT — LEARN NOW
                                CourseCard(
                                  language: "JavaScript",
                                  description:
                                      "Master JavaScript for web development and interactive user interfaces.",
                                  progress: 0.0,
                                  icon: Icons.javascript,
                                  status: CourseStatus.learnNow,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            TopicPage(languageId: 3),
                                      ),
                                    );
                                  },
                                ),

                                /// HTML — LEARN NOW
                                CourseCard(
                                  language: "HTML",
                                  description:
                                      "Learn HTML to build and structure modern web pages from scratch.",
                                  progress: 0.0,
                                  icon: Icons.language,
                                  status: CourseStatus.learnNow,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            TopicPage(languageId: 1),
                                      ),
                                    );
                                  },
                                ),

                                /// JAVA — CLOSED
                                CourseCard(
                                  language: "Java",
                                  description:
                                      "Understand Java for enterprise applications and Android development.",
                                  progress: 0.0,
                                  icon: Icons.lock,
                                  status: CourseStatus.closed,
                                  onTap: () {
                                    debugPrint("Java course is closed");
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),

                        // 2️⃣ Assignments tab
                        CodeEditorScreen(),

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
                                onPressed: () =>
                                    debugPrint("Continue Python Quiz"),
                              ),
                              CodingQuizCard(
                                language: "JavaScript",
                                languageIcon: Icons.code,
                                progress: 1.0,
                                onPressed: () =>
                                    debugPrint("Completed JavaScript Quiz"),
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
                                ProjectList(),
                                // <- this includes Add button + dynamic project cards
                              ],
                            ),
                          ),
                        ),

                        SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(children: [CodingProfileCard()]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
