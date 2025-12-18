import 'package:flutter/material.dart';

import '../Widgets/ExamActionRow.dart';
import '../Widgets/IntroductionWidget.dart';

class Parentdashboardpage extends StatefulWidget {
  const Parentdashboardpage({super.key});

  @override
  State<Parentdashboardpage> createState() => _ParentdashboardpageState();
}

class _ParentdashboardpageState extends State<Parentdashboardpage> {

  Exam? selectedExam;

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
                            color: Colors.white
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
          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Introductionwidget(
                ),
                SizedBox(height: screenHeight * 0.02,),
                Text("Analysis",style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold,letterSpacing: 0.2,),),
                Text("Student's Exam Performance Analysis",style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.normal,color: theme.disabledColor),),
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

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Curriculum Subjects",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        /// Primary color underline (fixed width)
                        Container(
                          height: 2,
                          width: screenWidth * 0.4,
                          decoration: BoxDecoration(
                            color: theme.primaryColor,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        /// Disabled color remainder
                        Expanded(
                          child: Container(
                            height: 1,
                            color: theme.disabledColor.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),


              ],
            ),
          ))
        ],
      ),
    );
  }
}
