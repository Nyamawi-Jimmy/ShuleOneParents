class Codingexamplemodel {
  final String title;
  final String type;
  final String content;

  Codingexamplemodel({
    required this.title,
    required this.type,
    required this.content,
  });

  factory Codingexamplemodel.fromJson(Map<String, dynamic> json) {
    return Codingexamplemodel(
      title: json['title'],
      type: json['type'],
      content: json['content'],
    );
  }
}
