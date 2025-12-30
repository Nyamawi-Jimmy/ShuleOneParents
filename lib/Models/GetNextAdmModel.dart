class GetNextAdmModel {
  String? nextadm;

  GetNextAdmModel({this.nextadm});

  GetNextAdmModel.fromJson(Map<String, dynamic> json) {
    nextadm = json['nextadm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nextadm'] = this.nextadm;
    return data;
  }
}
