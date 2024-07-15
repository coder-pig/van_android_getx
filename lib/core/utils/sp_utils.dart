import 'package:get_storage/get_storage.dart';

class SPUtil {
  static GetStorage _sp() => GetStorage("my_sp");
  final cookies = ''.val("Cookie", getBox: _sp);
}