import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shuleoneparents/Data/Api/apiclient.dart';

import '../Authentication/AuthControllers/ParentControler.dart';
import '../Models/MainExamsModal.dart';
import '../Models/StudentFeeBAlanceMOdel.dart';
import '../ParentsPages/ParentProfilePage.dart';
import '../ParentsPages/SettingsParentPage.dart';
import '../StudentControllers/FeeBalanceController.dart';
import '../StudentControllers/GetStudentsPerformanceController.dart';
import '../StudentControllers/MainExamsController.dart';
import '../StudentControllers/StudentAssignmentsController.dart';
import '../StudentControllers/StudentLIveClassesController.dart';
import '../Widgets/AssignmentCardWidget.dart';
import '../Widgets/BalanceCardWidget.dart';
import '../Widgets/ExamActionRow.dart';
import '../Widgets/GradesCardWidget.dart';
import '../Widgets/LiveClassCardWidget.dart';
import '../Widgets/StatsMinCard.dart';
import '../Widgets/SubjectMarksChart.dart';
import '../Widgets/SubjectResutsTable.dart';

class Studentdashboard extends StatefulWidget {
  const Studentdashboard({super.key});

  @override
  State<Studentdashboard> createState() => _StudentdashboardState();
}

class _StudentdashboardState extends State<Studentdashboard> {
  MainExam? selectedExam;
  List<MainExam> exams = [];
  List<dynamic> _assignments = [];
  List<dynamic> _liveclasses = [];



  @override
  void initState() {
    _mainexansdetails();
    _studentassignments();
    _studentsliveclasses();
    super.initState();
  }

  Map<String, double> _studentScores = {};
  Map<String, double> _subjectAverages = {};
  List<dynamic> _subjectResults = [];

  void _mainexansdetails() async {
    final controller = Get.find<Mainexamscontroller>();
    final response = await controller.mainexamsdetails();

    if (response.isSuccess) {
      final List data = jsonDecode(response.message);
      print(response.message);

      setState(() {
        exams = data.map((e) => MainExam.fromJson(e)).toList();
        selectedExam = exams.isNotEmpty ? exams.first : null;
      });
      if (selectedExam != null) {
        _loadExamPerformance(selectedExam!.id);
      }
    }
  }

  void _loadExamPerformance(int examId) async {
    final controller = Get.find<Getstudentsperformancecontroller>();
    final response = await controller.getStudentPerformance(examId);

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

  void _studentassignments() async {

    final controller = Get.find<Studentassignmentscontroller>();
    final response = await controller.studentassignments();

    if (response.isSuccess) {
      final List data = jsonDecode(response.message); // parse JSON
      setState(() {
        _assignments = data;
      });
    } else {
      setState(() {
        _assignments = [];
      });
    }
  }
  void _studentsliveclasses() async {

    final controller = Get.find<Studentliveclassescontroller>();
    final response = await controller.studentliveclasses();

    if (response.isSuccess) {
      final List data = jsonDecode(response.message); // parse JSON
      setState(() {
        _liveclasses = data;
      });
    } else {
      setState(() {
        _liveclasses = [];
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

  AssignmentStatus parseStatus(String status) {
    switch (status.toLowerCase()) {
      case 'marked':
        return AssignmentStatus.Marked;
      case 'inprogress':
        return AssignmentStatus.InProgress;
      case 'expired':
        return AssignmentStatus.Expired;
      default:
        return AssignmentStatus.Pending;
    }
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

                                    _loadExamPerformance(
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
                              children: _assignments.map((assignment) {
                                return AssignmentCard(
                                  assignmentName: assignment['title'] ?? "",
                                  deadline: assignment['deadline'] ?? "",
                                  status: parseStatus(assignment['status'] ?? ""),
                                  score: assignment['score'] ?? "",
                                  onShowResults: (){},
                                );
                              }).toList(),
                            ),
                          ),
                        ),

                        // 3️⃣ Live Classes tab
                        SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children:_liveclasses.map((liveclasses){
                                return LiveClassCard(
                                  title: liveclasses['title'],
                                  subtitle: liveclasses['description'],
                                  status: LiveClassStatusX.fromString(liveclasses["status"]),
                                  startsOn:liveclasses["startson"],
                                );
                              }).toList()
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
