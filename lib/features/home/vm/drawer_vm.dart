import 'package:get/get.dart';
import 'package:van_android_getx/core/services/api/van_api.dart';
import 'package:van_android_getx/core/utils/toast_utils.dart';
import 'package:van_android_getx/features/account/account_vm.dart';

class DrawerVm extends GetxController {

  // 查询积分
  Future<void> fetchCoin() async {
    final result = await VanApi.requestCoin();
    if (result.error == null) {
      Get.find<AccountVM>().accountInfo.update((accountInfo) {
        accountInfo?.coinCount = result.data!.coinCount;
        showToast(msg: "积分刷新成功");
      });
    } else {
      showToast(msg: result.errorMsg);
    }
  }
}