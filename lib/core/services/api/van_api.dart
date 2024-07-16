import 'package:get/get.dart';
import 'package:van_android_getx/data/model/account_login.dart';
import 'package:van_android_getx/data/model/account_register.dart';
import 'package:van_android_getx/data/model/base_response.dart';
import 'package:van_android_getx/data/model/account_info.dart';
import 'package:van_android_getx/data/model/home_article_info.dart';
import 'package:van_android_getx/data/model/home_banner_info.dart';
import 'package:van_android_getx/data/model/integral.dart';

import 'api_client.dart';

class VanApi {
  // 是否处于登录状态
  static bool isLogin() => Get.find<ApiClient>().isLogin;

  // 更新Cookies
  static updateCookies(String cookies) => Get.find<ApiClient>().updateCookies(cookies);

  // 请求登录
  static Future<DataResponse<AccountInfo?>> login(AccountLoginReq req) =>
      Get.find<ApiClient>().postX("user/login", query: req.toJson(), fromJsonT: (json) => AccountInfo.fromJson(json));

  // 请求注册
  static Future<DataResponse<AccountInfo?>> register(AccountRegisterReq req) => Get.find<ApiClient>()
      .postX("user/register", query: req.toJson(), fromJsonT: (json) => AccountInfo.fromJson(json));

  // 查询积分
  static Future<DataResponse<Integral?>> requestCoin() =>
      Get.find<ApiClient>().getX("lg/coin/userinfo/json", fromJsonT: (json) => Integral.fromJson(json));

  // 首页文章
  static Future<DataResponse<HomeArticleInfo?>> homeArticleList(int currentPage) =>
      Get.find<ApiClient>().getX("article/list/$currentPage/json", fromJsonT: (json) => HomeArticleInfo.fromJson(json));

  // 首页Banner
  static Future<ListResponse<HomeBannerInfo>> homeBanner() =>
      Get.find<ApiClient>().getX("banner/json", fromJsonT: (json) => HomeBannerInfo.fromJson(json));
}
