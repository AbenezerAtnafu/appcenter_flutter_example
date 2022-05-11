class Code {
  RequestCode? requestCode;

  Code({this.requestCode});

  Code.fromJson(Map<String, dynamic> json) {
    requestCode = json['requestCode'] != null
        ? new RequestCode.fromJson(json['requestCode'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.requestCode != null) {
      data['requestCode'] = this.requestCode!.toJson();
    }
    return data;
  }
}

class RequestCode {
  String? requestId;
  String? sentCode;

  RequestCode({this.requestId, this.sentCode});

  RequestCode.fromJson(Map<String, dynamic> json) {
    requestId = json['requestId'];
    sentCode = json['sentCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['requestId'] = this.requestId;
    data['sentCode'] = this.sentCode;
    return data;
  }
}
