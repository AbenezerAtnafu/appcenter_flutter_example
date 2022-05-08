class User {
  UserLogin? userLogin;

  User({this.userLogin});

  User.fromJson(Map<String, dynamic> json) {
    userLogin = json['userLogin'] != null
        ? UserLogin.fromJson(json['userLogin'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userLogin != null) {
      data['userLogin'] = userLogin!.toJson();
    }
    return data;
  }
}

class UserLogin {
  Authenticatable? authenticatable;
  Credentials? credentials;

  UserLogin({this.authenticatable, this.credentials});

  UserLogin.fromJson(Map<String, dynamic> json) {
    authenticatable = json['authenticatable'] != null
        ? Authenticatable.fromJson(json['authenticatable'])
        : null;
    credentials = json['credentials'] != null
        ? Credentials.fromJson(json['credentials'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (authenticatable != null) {
      data['authenticatable'] = authenticatable!.toJson();
    }
    if (credentials != null) {
      data['credentials'] = credentials!.toJson();
    }
    return data;
  }
}

class Authenticatable {
  String? email;
  String? id;
  String? name;
  String? phoneNumber;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['id'] = id;
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['roles'] = roles;
    return data;
  }
}

class Credentials {
  String? accessToken;
  String? client;
  int? expiry;
  String? tokenType;
  String? uid;

  Credentials(
      {this.accessToken, this.client, this.expiry, this.tokenType, this.uid});

  Credentials.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    client = json['client'];
    expiry = json['expiry'];
    tokenType = json['tokenType'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['client'] = client;
    data['expiry'] = expiry;
    data['tokenType'] = tokenType;
    data['uid'] = uid;
    return data;
  }
}
