import 'package:flutter/material.dart';

class Parentprofilepage extends StatefulWidget {
  const Parentprofilepage({super.key});

  @override
  State<Parentprofilepage> createState() => _ParentprofilepageState();
}

class _ParentprofilepageState extends State<Parentprofilepage> {
  int activeStudentIndex = 0;

  final List<Map<String, String>> students = [
    {
      "name": "Brian Otieno",
      "adm": "ADM-2041",
      "school": "ShuleOne Academy",
      "class": "Grade 6",
    },
    {
      "name": "Faith Achieng",
      "adm": "ADM-3128",
      "school": "ShuleOne Academy",
      "class": "Grade 4",
    },
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

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _parentHeader(theme),
            
                  const SizedBox(height: 20),
            
                  /// ================= STUDENTS =================
                  Text(
                    "My Children",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
            
                  ...List.generate(
                    students.length,
                        (index) => _studentCard(
                      theme,
                      student: students[index],
                      isActive: index == activeStudentIndex,
                      onSwitch: () {
                        setState(() {
                          activeStudentIndex = index;
                        });
                      },
                    ),
                  ),
            
                  const SizedBox(height: 30),
            
                  /// ================= DELETE ACCOUNT =================
                  _deleteAccountSection(theme),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ================= PARENT HEADER =================
  Widget _parentHeader(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: theme.primaryColor,
            child: const Icon(Icons.person, color: Colors.white, size: 32),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jimmy Nyamawi",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Parent Account",
                style: theme.textTheme.bodySmall,
              ),
            ],
          )
        ],
      ),
    );
  }

  /// ================= STUDENT CARD =================
  Widget _studentCard(
      ThemeData theme, {
        required Map<String, String> student,
        required bool isActive,
        required VoidCallback onSwitch,
      }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isActive
              ? theme.primaryColor
              : theme.disabledColor.withOpacity(0.3),
          width: isActive ? 1.6 : 1,
        ),
        color: isActive
            ? theme.primaryColor.withOpacity(0.05)
            : theme.cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// NAME + ACTIVE BADGE
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                student["name"]!,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (isActive)
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Active",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 6),

          _infoRow(Icons.confirmation_number, "Adm No", student["adm"]!),
          _infoRow(Icons.school, "School", student["school"]!),
          _infoRow(Icons.class_, "Class", student["class"]!),

          const SizedBox(height: 10),

          /// SWITCH BUTTON
          if (!isActive)
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton(
                onPressed: onSwitch,
                style: OutlinedButton.styleFrom(
                  foregroundColor: theme.primaryColor,
                  side: BorderSide(color: theme.primaryColor),
                ),
                child: const Text("Switch"),
              ),
            ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey),
          const SizedBox(width: 6),
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  /// ================= DELETE ACCOUNT =================
  Widget _deleteAccountSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: theme.disabledColor.withOpacity(0.3)),
        const SizedBox(height: 10),
        Text(
          "Delete Account",
          style: theme.textTheme.titleSmall?.copyWith(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Icon(Icons.delete_outline),
            label: const Text("Delete Account"),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              side: const BorderSide(color: Colors.red),
            ),
            onPressed: () => _confirmDeleteAccount(),
          ),
        ),
      ],
    );
  }

  void _confirmDeleteAccount() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Delete Account"),
        content: const Text(
          "This action is permanent. All student data will be removed.\n\nAre you sure?",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              Navigator.pop(context);
              // TODO: Call delete API
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }
}
