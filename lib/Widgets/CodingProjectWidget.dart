import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String name;
  final String description;
  final String dateCreated;
  final String language;
  final IconData languageIcon;

  const ProjectCard({
    super.key,
    required this.name,
    required this.description,
    required this.dateCreated,
    required this.language,
    required this.languageIcon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Project Name
            Text(
              name,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.primaryColor,
              ),
            ),
            const SizedBox(height: 6),

            /// Language
            Row(
              children: [
                Icon(languageIcon, size: 20, color: theme.primaryColor),
                const SizedBox(width: 6),
                Text(
                  language,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            /// Description
            Text(
              description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.disabledColor,
              ),
            ),
            const SizedBox(height: 12),

            /// Creation Date
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(
                  "Created on: $dateCreated",
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.disabledColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// === Project List with Add New Project ===
class ProjectList extends StatefulWidget {
  const ProjectList({super.key});

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  final List<ProjectCard> _projects = [];

  /// Predefined language options
  final Map<String, IconData> _languages = {
    "Dart": Icons.flutter_dash,
    "JavaScript": Icons.code,
    "Python": Icons.memory,
    "Java": Icons.coffee,
    "C++": Icons.developer_mode,
  };

  void _showAddProjectDialog() {
    String projectName = "";
    String? selectedLanguage;
    String description = "";

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add New Project"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Project Name
              TextField(
                decoration: const InputDecoration(
                  labelText: "Project Name",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => projectName = value,
              ),
              const SizedBox(height: 12),

              /// Language Dropdown
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Language",
                  border: OutlineInputBorder(),
                ),
                items: _languages.keys
                    .map((lang) => DropdownMenuItem(
                  value: lang,
                  child: Text(lang),
                ))
                    .toList(),
                onChanged: (value) => selectedLanguage = value,
              ),
              const SizedBox(height: 12),

              /// Description
              TextField(
                decoration: const InputDecoration(
                  labelText: "Short Description",
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
                onChanged: (value) => description = value,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              if (projectName.isEmpty || selectedLanguage == null || description.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Please fill all fields")),
                );
                return;
              }

              setState(() {
                _projects.add(ProjectCard(
                  name: projectName,
                  description: description,
                  dateCreated: DateTime.now().toString().split(" ")[0],
                  language: selectedLanguage!,
                  languageIcon: _languages[selectedLanguage!]!,
                ));
              });
              Navigator.pop(context);
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          /// Add New Project Button
          ElevatedButton.icon(
            onPressed: _showAddProjectDialog,
            icon: const Icon(Icons.add),
            label: const Text("Add New Project"),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: const Size(double.infinity, 48),
            ),
          ),
          const SizedBox(height: 12),

          /// Project Cards
          ..._projects,
        ],
      ),
    );
  }
}
