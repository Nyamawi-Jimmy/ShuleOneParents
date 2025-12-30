class MainExam {
  final int id;
  final String examName;
  final double mean;
  final String grade;
  final double points;

  MainExam({
    required this.id,
    required this.examName,
    required this.mean,
    required this.grade,
    required this.points,
  });

  factory MainExam.fromJson(Map<String, dynamic> json) {
    return MainExam(
      id: json['id'],
      examName: json['examName'],
      mean: (json['Mean'] as num).toDouble(),
      grade: json['grade'],
      points: (json['points'] as num).toDouble(),
    );
  }
}
