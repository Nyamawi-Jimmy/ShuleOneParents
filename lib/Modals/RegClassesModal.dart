class RegClassesModel {
  final int id;
  final String classField;

  RegClassesModel({required this.id, required this.classField});

  factory RegClassesModel.fromJson(Map<String, dynamic> json) {
    return RegClassesModel(
      id: json['id'],
      classField: json['classField'],
    );
  }

  @override
  String toString() => classField; // <--- This fixes the display
}
