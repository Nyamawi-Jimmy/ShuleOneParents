import 'package:flutter/material.dart';

import '../Widgets/ExamActionRow.dart';
import '../Widgets/GradesCardWidget.dart';
import '../Widgets/IntroductionWidget.dart';
import '../Widgets/StatsMinCard.dart';
import '../Widgets/SubjectMarksChart.dart';
import '../Widgets/SubjectResutsTable.dart';

class Parentdashboardpage extends StatefulWidget {
  const Parentdashboardpage({super.key});

  @override
  State<Parentdashboardpage> createState() => _ParentdashboardpageState();
}

class _ParentdashboardpageState extends State<Parentdashboardpage> {
  Exam? selectedExam;
  int _currentIndex = 0;

  final List<Exam> exams = [
    Exam(name: "Opener Exam", term: "Term 1", form: "Form 2"),
    Exam(name: "Mid Term", term: "Term 2", form: "Form 3"),
    Exam(name: "End Term", term: "Term 2", form: "Form 3"),
    Exam(name: "Mock Exam", term: "Term 3", form: "Form 4"),
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
            length: 3, // Dashboard, Assignments, Live Classes
            child: Expanded(
              child: Column(
                children: [
                  TabBar(
                    labelColor: theme.primaryColor,
                    unselectedLabelColor: theme.disabledColor,
                    indicatorColor: theme.primaryColor,
                    tabs: const [
                      Tab(text: "Dashboard"),
                      Tab(text: "Assignments"),
                      Tab(text: "Live Classes"),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Introductionwidget(),
                                SizedBox(height: screenHeight * 0.02),
                                Text(
                                  "Analysis",
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.2,
                                  ),
                                ),
                                Text(
                                  "Student's Exam Performance Analysis",
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: theme.disabledColor,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                ExamActionRow(
                                  selectedExam: selectedExam,
                                  exams: exams,
                                  onExamChanged: (exam) {
                                    setState(() {
                                      selectedExam = exam;
                                    });
                                  },
                                  onDownloadSelected: (type) {
                                    if (type == "transcript") {
                                      debugPrint("Download Transcript for $selectedExam");
                                    } else if (type == "report") {
                                      debugPrint("Download Report Form for $selectedExam");
                                    }
                                  },
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                Gradescardwidget(),
                                SizedBox(height: screenHeight * 0.02),
                                Row(
                                  children: const [
                                    Expanded(
                                      child: StatsMiniCard(
                                        title: "Mean Marks",
                                        value: "66%",
                                        trendIcon: Icons.trending_up,
                                        trendValue: "7",
                                        trendColor: Colors.green,
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Expanded(
                                      child: StatsMiniCard(
                                        title: "Total Points",
                                        value: "64/96",
                                        trendIcon: Icons.trending_down,
                                        trendValue: "7",
                                        trendColor: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                Row( children: const [ Expanded( child: StatsMiniCard( title: "Overall Position", value: "104/441", trendIcon: Icons.trending_up, trendValue: "60", trendColor: Colors.green, ), ), SizedBox(width: 12), Expanded( child: StatsMiniCard( title: "Stream Position", value: "16/55", trendIcon: Icons.trending_up, trendValue: "6", trendColor: Colors.green, ), ), ], ),
                                SizedBox(height: screenHeight * 0.02),
                                SubjectMarksChart(
                                  subjectMarks: {
                                    "Math": 72,
                                    "Eng": 65,
                                    "Bio": 70,
                                    "Chem": 58,
                                    "Phy": 61,
                                    "Geo": 75,
                                  },
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                SubjectResultsTable(),
                              ],
                            ),
                          ),
                        ),

                        // 2️⃣ Assignments tab
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: const [
                                Text("Assignments will be shown here"),
                              ],
                            ),
                          ),
                        ),

                        // 3️⃣ Live Classes tab
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: const [
                                Text("Live Classes will be shown here"),
                              ],
                            ),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: theme.primaryColor,
        unselectedItemColor: theme.disabledColor,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          // Optional navigation logic
          switch (index) {
            case 0:
            // Dashboard
              break;
            case 1:
            // Coding
              break;
            case 2:
            // E-Library
              break;
            case 3:
            // Transport
              break;
            case 4:
            // Communication
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code_outlined),
            activeIcon: Icon(Icons.code),
            label: "Coding",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            activeIcon: Icon(Icons.menu_book),
            label: "E-Library",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus_outlined),
            activeIcon: Icon(Icons.directions_bus),
            label: "Transport",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            activeIcon: Icon(Icons.chat_bubble),
            label: "Communication",
          ),
        ],
      ),
    );
  }
}
