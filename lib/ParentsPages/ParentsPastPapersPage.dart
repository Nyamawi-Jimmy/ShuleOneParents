import 'package:flutter/material.dart';

class PastPapersPage extends StatefulWidget {
  const PastPapersPage({super.key});

  @override
  State<PastPapersPage> createState() => _PastPapersPageState();
}

class _PastPapersPageState extends State<PastPapersPage> {
  String selectedSubject = "All";

  final List<String> subjects = [
    "All",
    "Mathematics",
    "English",
    "Science",
    "Kiswahili",
    "History",
  ];

  final List<Map<String, String>> pastPapers = [
    {
      "subject": "Mathematics",
      "grade": "Grade 6",
      "year": "2023",
    },
    {
      "subject": "English",
      "grade": "Grade 5",
      "year": "2022",
    },
    {
      "subject": "Science",
      "grade": "Grade 6",
      "year": "2021",
    },
    {
      "subject": "Kiswahili",
      "grade": "Grade 4",
      "year": "2023",
    },
    {
      "subject": "History",
      "grade": "Grade 7",
      "year": "2022",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final filteredPapers = selectedSubject == "All"
        ? pastPapers
        : pastPapers
        .where((p) => p["subject"] == selectedSubject)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// ================= HEADER =================
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Exam Past Papers",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Download or share previous exam papers",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.disabledColor,
                ),
              ),
            ],
          ),
        ),

        /// ================= SUBJECT FILTER =================
        SizedBox(
          height: 48,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: subjects.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final subject = subjects[index];
              final selected = subject == selectedSubject;

              return FilterChip(
                label: Text(subject),
                selected: selected,
                showCheckmark: false,
                selectedColor: theme.primaryColor,
                backgroundColor: Colors.grey.shade200,
                labelStyle: TextStyle(
                  color: selected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
                onSelected: (_) {
                  setState(() {
                    selectedSubject = subject;
                  });
                },
              );
            },
          ),
        ),

        const SizedBox(height: 12),

        /// ================= PAPERS LIST =================
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: filteredPapers.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final paper = filteredPapers[index];

              return Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    /// ICON
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: theme.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.description,
                        color: theme.primaryColor,
                        size: 28,
                      ),
                    ),

                    const SizedBox(width: 14),

                    /// DETAILS
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${paper["subject"]} • ${paper["grade"]}",
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Year ${paper["year"]}",
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.disabledColor,
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// ACTIONS
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.share_outlined),
                          color: theme.primaryColor,
                          tooltip: "Share",
                          onPressed: () {
                            // TODO: Share logic
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.download_outlined),
                          color: theme.primaryColor,
                          tooltip: "Download",
                          onPressed: () {
                            // TODO: Download logic
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
