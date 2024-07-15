/// 自定义请求异常父类
class ApiException implements Exception {
  final int? code;
  final String? message;
  String? stackInfo;

  ApiException([this.code, this.message]);

  factory ApiException.from(dynamic exception) {
    if (exception is ApiException) {
      return exception;
    } else {
      throw exception;
      return ApiException(-1, "未知错误")..stackInfo = exception.toString();
    }
  }
}
