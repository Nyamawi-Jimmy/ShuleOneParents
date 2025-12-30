class RegisterModel {
  final String firstName;
  final String middleName;
  final String lastName;
  final String userName;
  final String admissionNumber;
  final String email;
  String? phone;
  final String password;
  final int selectedClass;

  RegisterModel({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.userName,
    required this.admissionNumber,
    required this.email,
    this.phone,
    required this.password,
    required this.selectedClass,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["firstName"] = this.firstName;
    data["middleName"] = this.middleName;
    data["lastName"] = this.lastName;
    data["userName"] = this.userName;
    data["email"] = this.email;
    data["phone"] = this.phone;
    data["password"] = this.password;
    data["admNo"] = this.admissionNumber;
    data["studentClass"] = this.selectedClass;

    return data;
  }
}
