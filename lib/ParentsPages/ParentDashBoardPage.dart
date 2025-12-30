import 'package:flutter/material.dart';

import '../Widgets/AssignmentCardWidget.dart';
import '../Widgets/BalanceCardWidget.dart';
import '../Widgets/ExamActionRow.dart';
import '../Widgets/GradesCardWidget.dart';
import '../Widgets/LiveClassCardWidget.dart';
import '../Widgets/StatsMinCard.dart';
import '../Widgets/SubjectMarksChart.dart';
import '../Widgets/SubjectResutsTable.dart';
import 'ParentProfilePage.dart';
import 'SettingsParentPage.dart';

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
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'profile') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const Parentprofilepage()),
                          );
                        } else if (value == 'settings') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const Settingsparentpage()),
                          );
                        }
                      },
                      itemBuilder: (context) => [
                         PopupMenuItem(
                          value: 'profile',
                          child: ListTile(
                            leading: Icon(Icons.person,color: theme.primaryColor,),
                            title: Text('Profile'),
                          ),
                        ),
                         PopupMenuItem(
                          value: 'settings',
                          child: ListTile(
                            leading: Icon(Icons.settings,color: theme.primaryColor,),
                            title: Text('Settings'),
                          ),
                        ),
                      ],
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/shuleone.png",
                          fit: BoxFit.cover,
                          height: 40,
                          width: 40,
                        ),
                      ),
                    )
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
                                SizedBox(height: screenHeight * 0.02),
                                BalanceCardWidget(),
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
                                /*ExamActionRow(
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
                                ),*/
                                SizedBox(height: screenHeight * 0.02),
                                //Gradescardwidget(),
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
                               /* SubjectMarksChart(
                                  subjectMarks: {
                                    "Math": 72,
                                    "Eng": 65,
                                    "Bio": 70,
                                    "Chem": 58,
                                    "Phy": 61,
                                    "Geo": 75,
                                  },
                                ),*/
                                SizedBox(height: screenHeight * 0.02),
                               // SubjectResultsTable(),
                              ],
                            ),
                          ),
                        ),

                        // 2️⃣ Assignments tab
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children:  [
                                AssignmentCard(
                                  assignmentName: "Math Homework 1",
                                  deadline: "20 Dec 2025",
                                  status: AssignmentStatus.Marked,
                                  score: 88.5,
                                ),
                                AssignmentCard(
                                  assignmentName: "Science Project",
                                  deadline: "22 Dec 2025",
                                  status: AssignmentStatus.InProgress,
                                ),
                                AssignmentCard(
                                  assignmentName: "English Essay",
                                  deadline: "25 Dec 2025",
                                  status: AssignmentStatus.Pending,
                                ),
                              ],
                            )

                          ),
                        ),

                        // 3️⃣ Live Classes tab
                        SingleChildScrollView(
                          child: Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: Column(
                              children:  [
                                LiveClassCard(
                                  title: "Math Revision",
                                  subtitle: "Algebra & Geometry",
                                  status: LiveClassStatus.Live,
                                  startsOn: "19 Dec 2025, 10:00 AM",
                                ),
                                LiveClassCard(
                                  title: "Physics Lab",
                                  subtitle: "Practical Experiments",
                                  status: LiveClassStatus.Pending,
                                  startsOn: "20 Dec 2025, 2:00 PM",
                                ),
                                LiveClassCard(
                                  title: "English Literature",
                                  subtitle: "Poetry Analysis",
                                  status: LiveClassStatus.Finished,
                                  startsOn: "18 Dec 2025, 11:00 AM",
                                ),
                              ],
                            )
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
