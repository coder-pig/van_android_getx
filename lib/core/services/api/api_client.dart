import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';
import 'package:van_android_getx/core/services/api/exceptions.dart';
import 'package:van_android_getx/core/utils/logger_utils.dart';
import 'package:van_android_getx/core/utils/sp_utils.dart';
import 'package:van_android_getx/data/model/account_info.dart';
import 'package:van_android_getx/data/model/base_response.dart';
import 'package:van_android_getx/widgets/loading_dialog.dart';

class ApiClient extends GetConnect {
  String? cookies;

  @override
  void onInit() async {
    httpClient.baseUrl = "https://www.wanandroid.com/";
    httpClient.timeout = const Duration(seconds: 30);
    // 读取本地存储的Cookie
    cookies = Get.find<GetStorage>().read("Cookie");
    LogUtil.d("本地暂存的Cookie: $cookies");
    // 添加请求拦截器,设置Cookie
    httpClient.addRequestModifier<void>((request) {
      if (cookies != null) {
        request.headers['Cookie'] = cookies!;
      }
      return request;
    });
    // 添加拦截器打印日志
    httpClient.addResponseModifier<dynamic>((request, response) {
      request.bodyBytes.bytesToString().then((value) => {
            LogUtil.d("Request headers: ${request.headers}"),
            LogUtil.d("Request Url: ${request.url}"),
            LogUtil.d("Request Body: $value"),
            LogUtil.d("Response headers: ${response.headers}"),
            LogUtil.d("Response Body: ${response.body}")
          });
      return response;
    });
    super.onInit();
  }

  // 请求响应的通用处理封装
  Future<R> _performRequestX<R, D>(Future<Response> Function() requestCall, D Function(dynamic json)? fromJsonT) async {
    try {
      // 加载对话框
      showLoadingDialog();
      // 执行对应的网络请求
      Response response = await requestCall();
      // 如果没设置fromJsonT或R是动态类型，直接返回响应数据
      if (fromJsonT == null || R == dynamic || response.body is! Map<String, dynamic>) return response.body;
      // 获取响应内容
      Map<String, dynamic>? responseObject = response.body;
      // 响应码为200，响应体不为空执行数据解析逻辑
      if (response.statusCode == 200 && responseObject != null && responseObject.isNotEmpty) {
        switch (responseObject['errorCode']) {
          // errorCode为 0 代表请求成功
          case 0:
            if (R.toString().contains("DataResponse")) {
              return (DataResponse<D>.fromJson(responseObject, fromJsonT)..headers = response.headers) as R;
            } else if (R.toString().contains("ListResponse")) {
              return (ListResponse<D>.fromJson(responseObject, fromJsonT)..headers = response.headers) as R;
            } else {
              throw ApiException(-1, "未知响应类型：$R");
            }
          // 不为 0 代表请求错误，直接抛异常等下统一处理
          default:
            throw ApiException(responseObject['errorCode'], responseObject['errorMsg']);
        }
      } else {
        throw ApiException(-1, "错误响应格式");
      }
    } catch (e) {
      final error = ApiException.from(e);
      if (R.toString().contains("DataResponse")) {
        // 对DataResponse<String?>做下特殊处理，不然会有类型转换异常
        if (R.toString() == "DataResponse<String?>") {
          return DataResponse<String?>(data: null, errorCode: -1, errorMsg: error.message ?? "未知异常", error: error) as R;
        }
        return DataResponse<D>(data: null, errorCode: -1, errorMsg: error.message ?? "未知异常", error: error) as R;
      } else if (R.toString().contains("ListResponse")) {
        // 对ListResponse<String?>做下特殊处理，不然会有类型转换异常
        if (R.toString() == "ListResponse<String?>") {
          return ListResponse<String?>(data: null, errorCode: -1, errorMsg: error.message ?? "未知异常", error: error) as R;
        }
        return ListResponse<D>(data: null, errorCode: -1, errorMsg: error.message ?? "未知异常", error: error) as R;
      } else {
        // 都没命中抛出异常
        rethrow;
      }
    } finally {
      // 判断有对话框打开才关闭
      if (Get.isDialogOpen == true) Get.back();
    }
  }

  /// 发起Post请求
  Future<R> postX<R, D>(String? url,
          {dynamic body,
          String? contentType,
          Map<String, String>? headers,
          Map<String, dynamic>? query,
          D Function(dynamic json)? fromJsonT}) =>
      _performRequestX(
          () => post(url, body ?? "{}", contentType: contentType, headers: headers, query: query), fromJsonT);

  /// 发起Get请求
  Future<R> getX<R, D>(String url,
          {Map<String, String>? headers,
          String? contentType,
          Map<String, dynamic>? query,
          D Function(dynamic json)? fromJsonT}) =>
      _performRequestX(() => get(url, contentType: contentType, headers: headers, query: query), fromJsonT);

  void updateCookies(String cookies) {
    this.cookies = cookies;
  }
}
