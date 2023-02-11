enum ResponseMessageCode { SUCCESS, ERROR, WRONG_DATA, CONTRACT_ERROR }

final ResponseStatusCode = {
  ResponseMessageCode.SUCCESS: 100,
  ResponseMessageCode.ERROR: 101,
  ResponseMessageCode.WRONG_DATA: 102,
  ResponseMessageCode.CONTRACT_ERROR: 103,
};

class ResponseMessage {
  dynamic messageCode;
  dynamic statusCode;
  String? message;
  dynamic data;

  ResponseMessage({this.messageCode, this.statusCode, this.message, this.data});

  ResponseMessage.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return;
    }
    messageCode = json['message_code'];
    statusCode = json['status_code'];
    if (json['message'] != null) message = json['message'];
    if (json['details'] != null) message = json['details'].toString();
    if (json['data'] != null) {
      data = json['data'];
    } else {
      data = json['payload'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message_code'] = this.messageCode;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    data['data'] = this.data;

    return data;
  }

  ResponseMessage.buildOk({dynamic data}) {
    statusCode = ResponseStatusCode[ResponseMessageCode.SUCCESS];
    this.data = data;
  }

  ResponseMessage.buildError({
    this.messageCode,
    this.statusCode,
    this.message,
  }) {
    if (statusCode == null)
      statusCode = ResponseStatusCode[ResponseMessageCode.ERROR];
    if (messageCode == null) messageCode = ResponseMessageCode.ERROR.name;

    if (message == null) message = "Error";
  }

  ResponseMessage.buildWrongData({
    this.messageCode,
    this.statusCode,
    this.message,
  }) {
    statusCode = ResponseStatusCode[ResponseMessageCode.WRONG_DATA];
    if (messageCode == null) messageCode = ResponseMessageCode.WRONG_DATA.name;

    if (message == null) message = "Wrong Data";
  }

  bool isOk() {
    final is100 = statusCode == ResponseStatusCode[ResponseMessageCode.SUCCESS];
    final isSuccess = statusCode == ResponseMessageCode.SUCCESS.name;
    return is100 || isSuccess;
  }

  String toString() {
    return "messageCode:$messageCode;statusCode:$statusCode;message:$message;data:$data";
  }
}
