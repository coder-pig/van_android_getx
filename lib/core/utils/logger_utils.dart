import 'package:logger/logger.dart';

/// 日志打印工具类
class LogUtil {
  static const String _tag = "Van♂Android GetX";
  static final _logger = Logger(printer: LongPrettyPrinter());
  static bool isEnabled = true; // 控制日志开关的标记

  // 通用的日志打印方法
  static void _printLog(Function(dynamic message) logFunction, dynamic message) {
    if (isEnabled) logFunction("$_tag :: $message");
  }

  static v(dynamic message) => _printLog(_logger.t, message);

  static d(dynamic message) => _printLog(_logger.d, message);

  static i(dynamic message) => _printLog(_logger.i, message);

  static w(dynamic message) => _printLog(_logger.w, message);

  static e(dynamic message) => _printLog(_logger.e, message);
}

// 自定义PrettyPrinter，对长消息进行分段，再合适位置插入换行符
class LongPrettyPrinter extends PrettyPrinter {
  final int wrapLen; // 截断输出的标准长度
  LongPrettyPrinter({this.wrapLen = 1000}) : super(methodCount: 0);

  @override
  String stringifyMessage(message) {
    var originMsg = super.stringifyMessage(message); // 获得原始消息
    var newMsg = ""; // 处理后的消息
    var i = 0; // 索引
    // 循环直到消息的剩余部分小于等于wrapLen
    while (originMsg.length > i) {
      var nextWrapPoint = (i + wrapLen < originMsg.length) ? i + wrapLen : originMsg.length;
      var nextLineBreak = originMsg.lastIndexOf("\n", nextWrapPoint);
      // 如果在当前段内找到了换行符，使用该换行符作为分割点
      if (nextLineBreak > i) {
        newMsg += originMsg.substring(i, nextLineBreak + 1);
        i = nextLineBreak + 1;
      } else {
        // 否则，直接使用wrapLen作为分割点，并添加换行符
        newMsg += originMsg.substring(i, nextWrapPoint) + ((nextWrapPoint < originMsg.length) ? "\n" : "");
        i = nextWrapPoint;
      }
    }
    return newMsg;
  }
}
