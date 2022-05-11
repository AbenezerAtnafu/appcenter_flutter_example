class UserSignedUp {
  UserSignUp? userSignUp;

  UserSignedUp({this.userSignUp});

  UserSignedUp.fromJson(Map<String, dynamic> json) {
    userSignUp = json['userSignUp'] != null
        ? new UserSignUp.fromJson(json['userSignUp'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userSignUp != null) {
      data['userSignUp'] = this.userSignUp!.toJson();
    }
    return data;
  }
}

class UserSignUp {
  Authenticatable? authenticatable;
  Null? credentials;

  UserSignUp({this.authenticatable, this.credentials});

  UserSignUp.fromJson(Map<String, dynamic> json) {
    authenticatable = json['authenticatable'] != null
        ? new Authenticatable.fromJson(json['authenticatable'])
        : null;
    credentials = json['credentials'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.authenticatable != null) {
      data['authenticatable'] = this.authenticatable!.toJson();
    }
    data['credentials'] = this.credentials;
    return data;
  }
}

class Authenticatable {
  String? email;
  String? id;
  String? name;
  Null? phoneNumber;
  List<String>? roles;

  Authenticatable(
      {this.email, this.id, this.name, this.phoneNumber, this.roles});

  Authenticatable.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['id'] = this.id;
    data['name'] = this.name;
    data['phoneNumber'] = this.phoneNumber;
    data['roles'] = this.roles;
    return data;
  }
}
