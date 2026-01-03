import 'CodingExampleModel.dart';

class Codingsubtitlemodel {
  final int id;
  final String subtitle;
  final String subtitleDescription;
  final Codingexamplemodel? example;

  Codingsubtitlemodel({
    required this.id,
    required this.subtitle,
    required this.subtitleDescription,
    this.example,
  });

  factory Codingsubtitlemodel.fromJson(Map<String, dynamic> json) {
    return Codingsubtitlemodel(
      id: json['id'],
      subtitle: json['subtitle'],
      subtitleDescription: json['subtitleDescription'],
      example:
      json['example'] != null ? Codingexamplemodel.fromJson(json['example']) : null,
    );
  }
}
