class RegisterState {
  final String firstName;
  final String middleName;
  final String LastName;
  final String UserName;
  final String admNo;
  final String selectedClass;
  final String phoneNumber;
  final String email;
  final String password;
  final String confirmPassword;
  final bool isLoading;
  final String? error;

  RegisterState({
    this.firstName = '',
    this.middleName = '',
    this.LastName = '',
    this.UserName = '',
    this.admNo = '',
    this.selectedClass = '',
    this.phoneNumber = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.isLoading = false,
    this.error,
  });

  RegisterState copyWith({
    String? error,
    bool? isLoading,
    String? firstName,
    String? middleName,
    String? LastName,
    String? UserName,
    String? admNo,
    String? selectedClass,
    String? phoneNumber,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return RegisterState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      LastName: LastName ?? this.LastName,
      UserName: UserName ?? this.UserName,
      admNo: admNo ?? this.admNo,
      selectedClass: selectedClass ?? this.selectedClass,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
