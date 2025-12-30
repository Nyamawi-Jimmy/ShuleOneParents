class StudentFeeBalance {
  final String bal;
  final String payable;
  final String examName;
  final String feeClass;

  StudentFeeBalance({
    required this.bal,
    required this.payable,
    required this.examName,
    required this.feeClass,
  });

  factory StudentFeeBalance.fromJson(Map<String, dynamic> json) {
    return StudentFeeBalance(
      bal: json['Bal'] ?? "0",
      payable: json['Payable'] ?? "0",
      examName: json['Examname'] ?? "",
      feeClass: json['Feeclass'] ?? "",
    );
  }
}
