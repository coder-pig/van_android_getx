import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:van_android_getx/core/services/api/api_client.dart';
import 'package:van_android_getx/features/account/account_vm.dart';

import 'main_vm.dart';

/// 首页的依赖注入绑定
class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetStorage());
    Get.lazyPut(() => ApiClient());
    Get.lazyPut(() => MainVM());
    Get.lazyPut(() => AccountVM());
  }
}
