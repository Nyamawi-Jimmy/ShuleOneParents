class SchoolClass {
  final int id;
  final String classField;
  final int school;
  final String status;

  SchoolClass({
    required this.id,
    required this.classField,
    required this.school,
    required this.status,
  });

  factory SchoolClass.fromJson(Map<String, dynamic> json) {
    return SchoolClass(
      id: json['id'],
      classField: json['classField'],
      school: json['school'],
      status: json['status'],
    );
  }
}
