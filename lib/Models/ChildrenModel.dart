class ChildModel {
  final int id;
  final String admNo;
  final String username;

  final String firstName;
  final String secondName;
  final String lastName;

  final String status;
  final String gender;
  final String image;

  final String dateOfBirth;
  final String dateOfJoining;
  final String? dateOfLeaving;

  final int xp;
  final int currentStreak;
  final int maxStreak;

  final String grade;
  final String stream;

  final SchoolModel school;

  ChildModel({
    required this.id,
    required this.admNo,
    required this.username,
    required this.firstName,
    required this.secondName,
    required this.lastName,
    required this.status,
    required this.gender,
    required this.image,
    required this.dateOfBirth,
    required this.dateOfJoining,
    this.dateOfLeaving,
    required this.xp,
    required this.currentStreak,
    required this.maxStreak,
    required this.grade,
    required this.stream,
    required this.school,
  });

  factory ChildModel.fromJson(Map<String, dynamic> json) {
    return ChildModel(
      id: json['id'],
      admNo: json['admNo'],
      username: json['username'],

      firstName: json['firstName'],
      secondName: json['secondName'],
      lastName: json['lastName'] ?? "",

      status: json['currStatus'],
      gender: json['gender'],
      image: json['image'],

      dateOfBirth: json['dateOfBirth'],
      dateOfJoining: json['dateOfJoining'],
      dateOfLeaving: json['dateOfLeaving'],

      xp: json['xp'] ?? 0,
      currentStreak: json['currentStreak'] ?? 0,
      maxStreak: json['maxStreak'] ?? 0,

      grade: json['currentForm']?['classField'] ?? "",
      stream: json['stream']?['stream'] ?? "",

      school: SchoolModel.fromJson(json['school']),
    );
  }

  String get fullName => "$firstName $secondName $lastName".trim();
}
class SchoolModel {
  final int id;
  final String name;
  final String shortName;
  final String uniqueName;
  final String phone;
  final String category;
  final String logo;

  SchoolModel({
    required this.id,
    required this.name,
    required this.shortName,
    required this.uniqueName,
    required this.phone,
    required this.category,
    required this.logo,
  });

  factory SchoolModel.fromJson(Map<String, dynamic> json) {
    return SchoolModel(
      id: json['id'],
      name: json['schoolName'],
      shortName: json['shortDisplayName'],
      uniqueName: json['uniqueName'],
      phone: json['phone'] ?? "",
      category: json['schoolCategory'],
      logo: json['logo'],
    );
  }
}
