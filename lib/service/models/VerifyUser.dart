class VerifyUser {
  VerifyCode? verifyCode;

  VerifyUser({this.verifyCode});

  VerifyUser.fromJson(Map<String, dynamic> json) {
    verifyCode = json['verifyCode'] != null
        ? new VerifyCode.fromJson(json['verifyCode'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.verifyCode != null) {
      data['verifyCode'] = this.verifyCode!.toJson();
    }
    return data;
  }
}

class VerifyCode {
  Authenticatable? authenticatable;
  Credentials? credentials;

  VerifyCode({this.authenticatable, this.credentials});

  VerifyCode.fromJson(Map<String, dynamic> json) {
    authenticatable = json['authenticatable'] != null
        ? new Authenticatable.fromJson(json['authenticatable'])
        : null;
    credentials = json['credentials'] != null
        ? new Credentials.fromJson(json['credentials'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.authenticatable != null) {
      data['authenticatable'] = this.authenticatable!.toJson();
    }
    if (this.credentials != null) {
      data['credentials'] = this.credentials!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['id'] = this.id;
    data['name'] = this.name;
    data['phoneNumber'] = this.phoneNumber;
    data['roles'] = this.roles;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['client'] = this.client;
    data['expiry'] = this.expiry;
    data['tokenType'] = this.tokenType;
    data['uid'] = this.uid;
    return data;
  }
}
