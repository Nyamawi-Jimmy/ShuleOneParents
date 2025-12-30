import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Models/MainExamsModal.dart';

class Exam {
  final String name;
  final String term;
  final String form;

  Exam({
    required this.name,
    required this.term,
    required this.form,
  });
}

class ExamActionRow extends StatelessWidget {
  final MainExam? selectedExam;
  final List<MainExam> exams;
  final ValueChanged<MainExam?> onExamChanged;
  final ValueChanged<String> onDownloadSelected;

  const ExamActionRow({
    super.key,
    required this.selectedExam,
    required this.exams,
    required this.onExamChanged,
    required this.onDownloadSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        /// 🔹 DOWNLOAD BUTTON
        Expanded(
          child: PopupMenuButton<String>(
            onSelected: selectedExam == null
                ? null
                : (value) => onDownloadSelected(value),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "transcript",
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.download, size: 20),
                    SizedBox(width: screenWidth * 0.02),
                    Text("Transcript"),
                  ],
                ),
              ),
              PopupMenuItem(
                value: "report",
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.download, size: 20),
                    SizedBox(width: screenWidth * 0.02),
                    Text("Report Form"),
                  ],
                ),
              ),
            ],
            child: Container(
              height: screenHeight * 0.05,
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.download, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    "Download",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        /// 🔹 EXAM DROPDOWN
        Expanded(
          child: Container(
            height: screenHeight * 0.054,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: theme.dividerColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<MainExam>(
                value: selectedExam,
                hint: Text(
                  "Select Exam",
                  style: theme.textTheme.bodyMedium,
                ),
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: exams.map((exam) {
                  return DropdownMenuItem<MainExam>(
                    value: exam,
                    child: Text(
                      exam.examName,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  );
                }).toList(),
                onChanged: onExamChanged,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
