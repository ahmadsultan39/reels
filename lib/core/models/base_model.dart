class BaseModel {
  final int statusCode;
  final String? message;
  final dynamic data;

  BaseModel({
    required this.statusCode,
    this.message,
    this.data,
  });

  factory BaseModel.fromJson(Map<String, dynamic> json) {
    return  BaseModel(
      statusCode: json['statusCode'] as int,
      message: json['message'] as String?,
      data: json['data'],
    );
  }
}