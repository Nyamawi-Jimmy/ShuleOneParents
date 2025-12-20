import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoLessonsPage extends StatelessWidget {
   VideoLessonsPage({super.key});
  final List<VideoLessonModel> videoLessons = [
    VideoLessonModel(
      title: "Introduction to Fractions",
      subject: "Mathematics",
      topic: "Fractions",
      category: "Revision",
      duration: "12:30",
      thumbnail: "assets/images/shuleone.png",
      isCompleted: false,
      isInProgress: true,
    ),
    VideoLessonModel(
      title: "Comprehension Skills",
      subject: "English",
      topic: "Reading",
      category: "Practice",
      duration: "09:45",
      thumbnail: "assets/images/shuleone.png",
      isCompleted: true,
      isInProgress: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: videoLessons.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return VideoLessonCard(lesson: videoLessons[index]);
      },
    );
  }
}
class VideoLessonModel {
  final String title;
  final String subject;
  final String topic;
  final String category;
  final String duration;
  final String thumbnail;
  final bool isCompleted;
  final bool isInProgress;

  VideoLessonModel({
    required this.title,
    required this.subject,
    required this.topic,
    required this.category,
    required this.duration,
    required this.thumbnail,
    required this.isCompleted,
    required this.isInProgress,
  });
}
class VideoLessonCard extends StatelessWidget {
  final VideoLessonModel lesson;

  const VideoLessonCard({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🎥 THUMBNAIL
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  lesson.thumbnail,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              /// ▶ PLAY ICON
              Positioned.fill(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      size: 34,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              /// ⏱ DURATION
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    lesson.duration,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),

          /// 📘 DETAILS
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lesson.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${lesson.subject} • ${lesson.category}",
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(height: 6),
                Text(
                  "Topic: ${lesson.topic}",
                  style: theme.textTheme.bodyMedium,
                ),

                const SizedBox(height: 12),

                /// ACTION ROW
                Row(
                  children: [
                    _statusChip(),
                    const Spacer(),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow,color: Colors.white,),
                      label: const Text("Play"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// STATUS CHIP
  Widget _statusChip() {
    if (lesson.isCompleted) {
      return _chip("Completed", Colors.green);
    }
    if (lesson.isInProgress) {
      return _chip("In Progress", Colors.orange);
    }
    return _chip("New", Colors.blue);
  }

  Widget _chip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}
