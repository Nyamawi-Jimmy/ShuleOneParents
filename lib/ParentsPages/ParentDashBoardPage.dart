import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../Authentication/AuthControllers/ParentControler.dart';
import '../Models/MainExamsModal.dart';
import '../ParentControllers/ParentMainExamsController.dart';
import '../ParentControllers/ParentStudentPerormanceController.dart';
import '../StudentControllers/FeeBalanceController.dart';
import '../StudentControllers/GetStudentsPerformanceController.dart';
import '../StudentControllers/MainExamsController.dart';
import '../Widgets/AssignmentCardWidget.dart';
import '../Widgets/BalanceCardWidget.dart';
import '../Widgets/ExamActionRow.dart';
import '../Widgets/GradesCardWidget.dart';
import '../Widgets/LiveClassCardWidget.dart';
import '../Widgets/StatsMinCard.dart';
import '../Widgets/SubjectMarksChart.dart';
import '../Widgets/SubjectResutsTable.dart';

class Parentdashboardpage extends StatefulWidget {
  const Parentdashboardpage({super.key});

  @override
  State<Parentdashboardpage> createState() => _ParentdashboardpageState();
}

class _ParentdashboardpageState extends State<Parentdashboardpage> {
  MainExam? selectedExam;
  List<MainExam> exams = [];

  @override
  void initState() {
    _parentmainexansdetails();
    super.initState();
  }

  Map<String, double> _studentScores = {};
  Map<String, double> _subjectAverages = {};
  List<dynamic> _subjectResults = [];

  void _parentmainexansdetails() async {
    final parentController = Get.find<ParentController>();
    final childId = parentController.selectedChildId;
    final controller = Get.find<Parentmainexamscontroller>();
    final response = await controller.getparentstudentmainexams(childId!);

    if (response.isSuccess) {
      final List data = jsonDecode(response.message);
      print(response.message);

      setState(() {
        exams = data.map((e) => MainExam.fromJson(e)).toList();
        selectedExam = exams.isNotEmpty ? exams.first : null;
      });
      if (selectedExam != null) {
        _loadparentxamPerformance(selectedExam!.id);
      }
    }
  }

  void _loadparentxamPerformance(int examId) async {
    final controller = Get.find<Parentstudentperormancecontroller>();
    final response = await controller.getparentStudentPerformance(examId);

    if (response.isSuccess) {
      final List<dynamic> data = response.message;
      _subjectResults = data; // 👈 store full response

      double parseScore(String score) {
        return double.parse(score.split('/').first);
      }

      /// Student scores
      final Map<String, double> studentScores = {
        for (final item in data) item['code']: parseScore(item['score']),
      };

      /// Subject averages
      final Map<String, double> subjectAverages = {
        for (final item in data)
          item['code']: (item['average'] as num).toDouble(),
      };
      setState(() {
        _studentScores = studentScores;
        _subjectAverages = subjectAverages;
      });
    }
  }

  IconData meanTrendIcon(double dev) {
    if (dev > 0) return Icons.trending_up;
    if (dev < 0) return Icons.trending_down;
    return Icons.trending_flat;
  }

  Color meanTrendColor(double dev) {
    if (dev > 0) return Colors.green;
    if (dev < 0) return Colors.red;
    return Colors.grey;
  }

  String meanTrendValue(double dev) {
    if (dev == 0) return "0.00";
    return dev > 0 ? "+${dev.toStringAsFixed(2)}" : dev.toStringAsFixed(2);
  }

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
                        return  Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              controller.selectedChild?.school?.shortName ?? "",
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
                              "${controller.selectedChild?.firstName} 👋",
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
                          /* Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const Parentprofilepage()),
                          );*/
                        } else if (value == 'settings') {
                          /* Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const Settingsparentpage()),
                          );*/
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
                                GetBuilder<FeeBalanceController>(
                                  init: FeeBalanceController()..loadBalance(),
                                  builder: (controller) {
                                    if (controller.isLoading) {
                                      return const SizedBox(
                                        height: 90,
                                        child: Center(child: CircularProgressIndicator()),
                                      );
                                    }

                                    return BalanceCardWidget(
                                      balance: controller.balance,
                                      onStatement: () => debugPrint("Open statement"),
                                      onReceipt: () => debugPrint("Open receipts"),
                                      onPayment: () => debugPrint("Make payment"),
                                    );
                                  },
                                ),
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
                                      _studentScores =
                                      {}; // optional: clear old data
                                      _subjectAverages = {};
                                    });

                                    _loadparentxamPerformance(
                                      exam!.id,
                                    ); // 🔥 THIS WAS MISSING
                                  },

                                  onDownloadSelected: (type) {
                                    debugPrint(
                                      "$type for ${selectedExam?.examName}",
                                    );
                                  },
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                GradesCardWidget(selectedExam: selectedExam),
                                SizedBox(height: screenHeight * 0.02),
                                Row(
                                  children: [
                                    Expanded(
                                      child: StatsMiniCard(
                                        title: "Mean Marks",
                                        value: selectedExam != null
                                            ? "${selectedExam!.mean.toStringAsFixed(2)}%"
                                            : "--",
                                        trendIcon: selectedExam != null
                                            ? meanTrendIcon(selectedExam!.dev)
                                            : Icons.trending_flat,
                                        trendValue: selectedExam != null
                                            ? meanTrendValue(selectedExam!.dev)
                                            : "",
                                        trendColor: selectedExam != null
                                            ? meanTrendColor(selectedExam!.dev)
                                            : Colors.grey,
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Expanded(
                                      child: StatsMiniCard(
                                        title: "Total Points",
                                        value: selectedExam != null
                                            ? selectedExam!.points
                                            .toStringAsFixed(2)
                                            : "--",
                                        trendIcon: selectedExam != null
                                            ? meanTrendIcon(selectedExam!.dev)
                                            : Icons.trending_flat,
                                        trendValue: selectedExam != null
                                            ? meanTrendValue(selectedExam!.dev)
                                            : "",
                                        trendColor: selectedExam != null
                                            ? meanTrendColor(selectedExam!.dev)
                                            : Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                Row(
                                  children: [
                                    Expanded(
                                      child: StatsMiniCard(
                                        title: "Overall Position",
                                        value: "--",
                                        trendIcon: Icons.trending_flat,
                                        trendValue: "--",
                                        trendColor: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Expanded(
                                      child: StatsMiniCard(
                                        title: "Stream Position",
                                        value: "--",
                                        trendIcon: Icons.trending_flat,
                                        trendValue: "--",
                                        trendColor: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: screenHeight * 0.02),
                                SubjectMarksChart(
                                  key: ValueKey(selectedExam?.id),
                                  subjectMarks: _studentScores,
                                  averageMarks: _subjectAverages,
                                ),

                                SizedBox(height: screenHeight * 0.02),
                                SubjectResultsTable(results: _subjectResults),
                              ],
                            ),
                          ),
                        ),

                        // 2️⃣ Assignments tab
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
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
                            ),
                          ),
                        ),

                        // 3️⃣ Live Classes tab
                        SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
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
                            ),
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
