
class BaseProvider {
  /// 1.初始化
  /// 提供 db 实例
  static final _instance = BaseProvider._internal();

  factory BaseProvider() => _instance;

  BaseProvider._internal();
}