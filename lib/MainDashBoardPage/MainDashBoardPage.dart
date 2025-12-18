import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/ModulesPageWidget.dart';

class Maindashboardpage extends StatefulWidget {
  const Maindashboardpage({super.key});

  @override
  State<Maindashboardpage> createState() => _MaindashboardpageState();
}

class _MaindashboardpageState extends State<Maindashboardpage> {
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
                    Icon(Icons.search, size: 20, color: Colors.white),
                    SizedBox(width: screenWidth * 0.04),
                    Icon(Icons.notification_add, size: 20, color: Colors.white),
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
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ModulesPageWidget(
                        title: "Modules",
                        modules: [
                          ModuleItem(
                            icon: Icons.app_registration, // better for Registration
                            label: "Registration",
                            color: Colors.blue,
                            onTap: () {
                              print("Registration tapped");
                            },
                          ),
                          ModuleItem(
                            icon: Icons.account_balance_wallet, // for Finance
                            label: "Finance",
                            color: Colors.green,
                            onTap: () {
                              print("Finance tapped");
                            },
                          ),
                          ModuleItem(
                            icon: Icons.assignment, // for Exam
                            label: "Exam",
                            color: Colors.orange,
                            onTap: () {
                              print("Exam tapped");
                            },
                          ),
                          ModuleItem(
                            icon: Icons.message, // for Messaging
                            label: "Messaging",
                            color: Colors.purple,
                            onTap: () {
                              print("Messaging tapped");
                            },
                          ),
                          ModuleItem(
                            icon: Icons.menu_book, // for E-learning
                            label: "E-learning",
                            color: Colors.red,
                            onTap: () {
                              print("E-learning tapped");
                            },
                          ),
                          ModuleItem(
                            icon: Icons.check_circle, // for Attendance
                            label: "Attendance",
                            color: Colors.teal,
                            onTap: () {
                              print("Attendance tapped");
                            },
                          ),
                          ModuleItem(
                            icon: Icons.payment, // for Payrolls
                            label: "Payrolls",
                            color: Colors.indigo,
                            onTap: () {
                              print("Payrolls tapped");
                            },
                          ),
                          ModuleItem(
                            icon: Icons.schedule, // for Timetable
                            label: "Timetable",
                            color: Colors.brown,
                            onTap: () {
                              print("Timetable tapped");
                            },
                          ),
                          ModuleItem(
                            icon: Icons.admin_panel_settings, // for Admin
                            label: "Admin",
                            color: Colors.deepOrange,
                            onTap: () {
                              print("Admin tapped");
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight*0.02,),
                      SizedBox(height: screenHeight*0.02,),

                      Text(
                        "Explore And Discover",
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
