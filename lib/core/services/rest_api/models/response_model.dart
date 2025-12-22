// ignore_for_file: prefer_typing_uninitialized_variables


// class ResponseModel<T> {
//   late bool success;
//   late String message;
//   int? statusCode;
//   APIError? errorType;
//   T? data;

//   ResponseModel({
//     required this.success,
//     this.data,
//     required this.message,
//     this.errorType,
//     this.statusCode,
//   });

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['success'] = success;
//     data['status_code'] = statusCode;
//     data['data'] = this.data;
//     data['message'] = message;
//     data['code'] = errorType;
//     return data;
//   }
// }
class ResponseModel<T> {
  bool success;
  int? statusCode;
  T? data;
  String? message;
  String? code;
  dynamic errorType;

  ResponseModel({
    required this.success,
    this.statusCode,
    this.data,
    this.message,
    this.code,
    this.errorType,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      success: json['success'] ?? true,
      statusCode: json['status_code'],
      data: json['data'] ?? json,
      message: json['message'],
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "status_code": statusCode,
      "data": data,
      "message": message,
      "code": code,
    };
  }
}


