
import 'CodingSubtopicModel.dart';

class Codingtopicmodel {
  final int id;
  final String title;
  final String? description;
  final List<Codingsubtopicmodel> subtopics;

  Codingtopicmodel({
    required this.id,
    required this.title,
    this.description,
    required this.subtopics,
  });

  factory Codingtopicmodel.fromJson(Map<String, dynamic> json) {
    return Codingtopicmodel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      subtopics: (json['subtopics'] as List)
          .map((e) => Codingsubtopicmodel.fromJson(e))
          .toList(),
    );
  }
}
