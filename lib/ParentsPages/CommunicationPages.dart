import 'package:flutter/material.dart';
import '../Widgets/ExamActionRow.dart';

class Communicationpages extends StatefulWidget {
  const Communicationpages({super.key});

  @override
  State<Communicationpages> createState() => _CommunicationpagesState();
}

class _CommunicationpagesState extends State<Communicationpages> {
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
            length: 3, // Dashboard, Assignments, Live Classes
            child: Expanded(
              child: Column(
                children: [
                  TabBar(
                    labelColor: theme.primaryColor,
                    unselectedLabelColor: theme.disabledColor,
                    indicatorColor: theme.primaryColor,
                    tabs: const [
                      Tab(text: "Assesment Rubrics"),
                      Tab(text: "Diary"),
                      Tab(text: "Inbox"),
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
                                Text(
                                  "Rubrics",
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.2,
                                  ),
                                ),

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
                                  Text(
                                    "Diary",
                                    style: theme.textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.2,
                                    ),
                                  ),

                                ],                              )

                          ),
                        ),

                        // 3️⃣ Live Classes tab
                        SingleChildScrollView(
                          child: Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  "Inbox",
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.2,
                                  ),
                                ),

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
