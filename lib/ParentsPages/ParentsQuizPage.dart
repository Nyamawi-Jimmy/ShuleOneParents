import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Parentsquizpage extends StatelessWidget {
   Parentsquizpage({super.key});
  final List<QuizModel> quizzes = [
    QuizModel(
      quizNo: "Quiz 01",
      subject: "Mathematics",
      topic: "Fractions",
      category: "Revision",
      isAvailable: true,
      isAttempted: false,
    ),
    QuizModel(
      quizNo: "Quiz 02",
      subject: "English",
      topic: "Comprehension",
      category: "Practice",
      isAvailable: true,
      isAttempted: true,
      score: 78,
    ),
    QuizModel(
      quizNo: "Quiz 03",
      subject: "Science",
      topic: "Energy",
      category: "Assessment",
      isAvailable: false,
      isAttempted: false,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final availableQuizzes =
    quizzes.where((q) => q.isAvailable).toList();

    final attemptedQuizzes =
    quizzes.where((q) => q.isAttempted).toList();

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelColor: theme.primaryColor,
            unselectedLabelColor: theme.disabledColor,
            tabs: const [
              Tab(text: "Available"),
              Tab(text: "Attempted"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _quizList(theme, availableQuizzes),
                _quizList(theme, attemptedQuizzes),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _quizList(ThemeData theme, List<QuizModel> list) {
    if (list.isEmpty) {
      return const Center(child: Text("No quizzes available"));
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: list.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return QuizCard(quiz: list[index]);
      },
    );
  }
}
class QuizModel {
  final String quizNo;
  final String subject;
  final String topic;
  final String category;
  final bool isAvailable;
  final bool isAttempted;
  final int? score;

  QuizModel({
    required this.quizNo,
    required this.subject,
    required this.topic,
    required this.category,
    required this.isAvailable,
    required this.isAttempted,
    this.score,
  });
}
class QuizCard extends StatelessWidget {
  final QuizModel quiz;

  const QuizCard({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TOP ROW
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.quiz, color: theme.primaryColor),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      quiz.quizNo,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${quiz.subject} • ${quiz.category}",
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              _statusChip(theme),
            ],
          ),

          const SizedBox(height: 10),

          /// TOPIC
          Text(
            "Topic: ${quiz.topic}",
            style: theme.textTheme.bodyMedium,
          ),

          if (quiz.isAttempted && quiz.score != null) ...[
            const SizedBox(height: 6),
            Text(
              "Score: ${quiz.score}%",
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: quiz.score! >= 50 ? Colors.green : Colors.red,
              ),
            ),
          ],

          const SizedBox(height: 12),

          /// ACTION BUTTONS
          Row(
            children: [
              if (quiz.isAvailable && !quiz.isAttempted)
                _actionButton(
                  label: "Start",
                  icon: Icons.play_arrow,
                  color: theme.primaryColor,
                  onTap: () {},
                ),

              if (quiz.isAttempted) ...[
                _actionButton(
                  label: "Preview",
                  icon: Icons.visibility,
                  color: Colors.blue,
                  onTap: () {},
                ),
                const SizedBox(width: 8),
                _actionButton(
                  label: "Retry",
                  icon: Icons.refresh,
                  color: Colors.orange,
                  onTap: () {},
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 18),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _statusChip(ThemeData theme) {
    if (!quiz.isAvailable) {
      return _chip("Locked", Colors.grey);
    }
    if (quiz.isAttempted) {
      return _chip("Attempted", Colors.green);
    }
    return _chip("Available", theme.primaryColor);
  }

  Widget _chip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: TextStyle(color: color)),
    );
  }
}
