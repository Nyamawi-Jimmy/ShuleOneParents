class LoginModel {
  String? refreshToken;
  int? id;
  String? username;
  String? school;
  List<String>? roles;
  String? image;
  String? subscription;
  List<Children>? children;
  String? tokenType;
  int? viwmode;
  String? accessToken;
  String? firstName;
  String? secondName;
  String? password;


  LoginModel(
      {this.refreshToken,
        this.id,
        this.username,
        this.school,
        this.roles,
        this.image,
        this.subscription,
        this.children,
        this.tokenType,
        this.viwmode,
        this.accessToken,
        this.firstName,
        this.secondName,
      this.password
      });

  LoginModel.fromJson(Map<String, dynamic> json) {
    refreshToken = json['refreshToken'];
    id = json['id'];
    username = json['username'];
    school = json['school'];
    roles = json['roles'].cast<String>();
    image = json['image'];
    subscription = json['subscription'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
    tokenType = json['tokenType'];
    viwmode = json['viwmode'];
    accessToken = json['accessToken'];
    firstName = json['firstName'];
    secondName = json['secondName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;

    return data;
  }
}

class Children {
  int? id;
  String? admNo;
  School? school;
  String? username;
  String? firstName;
  String? secondName;
  String? lastName;
  String? currStatus;
  Null? deactivatedAt;
  String? email;
  String? phone;
  String? image;
  String? gender;
  String? dateOfBirth;
  String? dateOfJoining;
  String? dateOfLeaving;
  int? theme;
  CurrentForm? currentForm;
  Stream? stream;
  String? password;
  int? xp;
  int? currentStreak;
  int? maxStreak;
  String? lastActivityTime;
  List<Roles>? roles;

  Children(
      {this.id,
        this.admNo,
        this.school,
        this.username,
        this.firstName,
        this.secondName,
        this.lastName,
        this.currStatus,
        this.deactivatedAt,
        this.email,
        this.phone,
        this.image,
        this.gender,
        this.dateOfBirth,
        this.dateOfJoining,
        this.dateOfLeaving,
        this.theme,
        this.currentForm,
        this.stream,
        this.password,
        this.xp,
        this.currentStreak,
        this.maxStreak,
        this.lastActivityTime,
        this.roles});

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    admNo = json['admNo'];
    school =
    json['school'] != null ? new School.fromJson(json['school']) : null;
    username = json['username'];
    firstName = json['firstName'];
    secondName = json['secondName'];
    lastName = json['lastName'];
    currStatus = json['currStatus'];
    deactivatedAt = json['deactivatedAt'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    dateOfJoining = json['dateOfJoining'];
    dateOfLeaving = json['dateOfLeaving'];
    theme = json['theme'];
    currentForm = json['currentForm'] != null
        ? new CurrentForm.fromJson(json['currentForm'])
        : null;
    stream =
    json['stream'] != null ? new Stream.fromJson(json['stream']) : null;
    password = json['password'];
    xp = json['xp'];
    currentStreak = json['currentStreak'];
    maxStreak = json['maxStreak'];
    lastActivityTime = json['lastActivityTime'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['admNo'] = this.admNo;
    if (this.school != null) {
      data['school'] = this.school!.toJson();
    }
    data['username'] = this.username;
    data['firstName'] = this.firstName;
    data['secondName'] = this.secondName;
    data['lastName'] = this.lastName;
    data['currStatus'] = this.currStatus;
    data['deactivatedAt'] = this.deactivatedAt;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['gender'] = this.gender;
    data['dateOfBirth'] = this.dateOfBirth;
    data['dateOfJoining'] = this.dateOfJoining;
    data['dateOfLeaving'] = this.dateOfLeaving;
    data['theme'] = this.theme;
    if (this.currentForm != null) {
      data['currentForm'] = this.currentForm!.toJson();
    }
    if (this.stream != null) {
      data['stream'] = this.stream!.toJson();
    }
    data['password'] = this.password;
    data['xp'] = this.xp;
    data['currentStreak'] = this.currentStreak;
    data['maxStreak'] = this.maxStreak;
    data['lastActivityTime'] = this.lastActivityTime;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class School {
  int? id;
  String? schoolName;
  String? shortDisplayName;
  String? uniqueName;
  String? email;
  String? phone;
  String? logo;
  String? schoolCategory;

  School(
      {this.id,
        this.schoolName,
        this.shortDisplayName,
        this.uniqueName,
        this.email,
        this.phone,
        this.logo,
        this.schoolCategory});

  School.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolName = json['schoolName'];
    shortDisplayName = json['shortDisplayName'];
    uniqueName = json['uniqueName'];
    email = json['email'];
    phone = json['phone'];
    logo = json['logo'];
    schoolCategory = json['schoolCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['schoolName'] = this.schoolName;
    data['shortDisplayName'] = this.shortDisplayName;
    data['uniqueName'] = this.uniqueName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['logo'] = this.logo;
    data['schoolCategory'] = this.schoolCategory;
    return data;
  }
}

class CurrentForm {
  int? id;
  String? classField;

  CurrentForm({this.id, this.classField});

  CurrentForm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classField = json['classField'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['classField'] = this.classField;
    return data;
  }
}

class Stream {
  int? id;
  String? stream;

  Stream({this.id, this.stream});

  Stream.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stream = json['stream'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stream'] = this.stream;
    return data;
  }
}

class Roles {
  int? id;
  String? name;

  Roles({this.id, this.name});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
