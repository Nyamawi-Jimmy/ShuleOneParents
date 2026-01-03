import 'CodingExampleModel.dart';
import 'CodingSubtitleModel.dart';

class Codingsubtopicmodel {
  final int id;
  final String title;
  final String description;
  final Codingexamplemodel? example;
  final List<Codingsubtitlemodel> subtitles;

  Codingsubtopicmodel({
    required this.id,
    required this.title,
    required this.description,
    this.example,
    required this.subtitles,
  });

  factory Codingsubtopicmodel.fromJson(Map<String, dynamic> json) {
    return Codingsubtopicmodel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      example:
      json['example'] != null ? Codingexamplemodel.fromJson(json['example']) : null,
      subtitles: (json['subtitles'] as List)
          .map((e) => Codingsubtitlemodel.fromJson(e))
          .toList(),
    );
  }
}
