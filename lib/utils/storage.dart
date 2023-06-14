import 'package:get_storage/get_storage.dart';
import 'package:xianyu/entity_class/serialize/user_info.dart';

enum StorageKeys {
  token,
  refreshToken,
  userInfo,
}

class Storage {
  static final Storage _storage = Storage._internal();

  final GetStorage _box = GetStorage();
  GetStorage get storage => _box;

  factory Storage() => _storage;

  Storage._internal();

  /// setToken getToken
  setToken(String token) => _box.write(StorageKeys.token.toString(), token);
  String? getToken() => _box.read<String>(StorageKeys.token.toString());

  /// setRefreshToken getRefreshToken
  setRefreshToken(String refreshToken) =>
      _box.write(StorageKeys.refreshToken.toString(), refreshToken);
  String? getRefreshToken() =>
      _box.read<String>(StorageKeys.refreshToken.toString());

  /// setUserInfo getUserInfo
  setUserInfo(UserInfo userInfo) =>
      _box.write(StorageKeys.userInfo.toString(), userInfo);
  UserInfo? getUserInfo() =>
      _box.read<UserInfo>(StorageKeys.userInfo.toString());
}
