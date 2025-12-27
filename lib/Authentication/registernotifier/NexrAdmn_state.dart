class NextAdmModel {
  String? nextadm;

  NextAdmModel({this.nextadm});

  NextAdmModel.fromJson(Map<String, dynamic> json) {
    nextadm = json['nextadm'];
  }

}
