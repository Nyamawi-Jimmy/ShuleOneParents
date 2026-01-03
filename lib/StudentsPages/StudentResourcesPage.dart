import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../Authentication/AuthControllers/ParentControler.dart';
import '../ParentsPages/ParentProfilePage.dart';
import '../ParentsPages/ParentVideoLessons.dart';
import '../ParentsPages/ParentsPastPapersPage.dart';
import '../ParentsPages/ParentsQuizPage.dart';
import '../ParentsPages/SettingsParentPage.dart';
import '../Widgets/ExamActionRow.dart';
import 'StudentEbookLibraryPage.dart';


class Studentresourcespage extends StatefulWidget {
  const Studentresourcespage({super.key});

  @override
  State<Studentresourcespage> createState() => _StudentresourcespageState();
}

class _StudentresourcespageState extends State<Studentresourcespage> {
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
            length: 4, // Dashboard, Assignments, Live Classes
            child: Expanded(
              child: Column(
                children: [
                  TabBar(
                    labelColor: theme.primaryColor,
                    unselectedLabelColor: theme.disabledColor,
                    indicatorColor: theme.primaryColor,
                    tabs: const [
                      Tab(text: " E-books"),
                      Tab(text: "PatPapers"),
                      Tab(text: "Quizes"),
                      Tab(text: "VideoLessons"),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // 1️⃣ Dashboard tab
                        Studentebooklibrarypage(),
                        // 2️⃣ Assignments tab
                       PastPapersPage(),                        // 3️⃣ Live Classes tab
                        Parentsquizpage(),
                        VideoLessonsPage()
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
