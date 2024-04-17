import '../../config/res/constans_manager.dart';
import '../helpers/cache_service.dart';

class GlobalUserData {
  String? token;
  String? deviceToken;
  // UserModel? _userModel;

  GlobalUserData._internal();
  static GlobalUserData? _instance;

  factory GlobalUserData() {
    _instance ??= GlobalUserData._internal();
    return _instance!;
  }

  void init({required String token, String? deviceToken}) {
    this.token = token;
    this.deviceToken = deviceToken;
  }

  Future<bool> get isUserLoggedIn async {
    final String? token = await CacheStorage.read(ConstantManager.token);
    return token != null && token.isNotEmpty;
  }

  String get getToken {
    if (token != null) {
      return token!;
    } else {
      throw Exception('Token is undefined, make sure to assign value to it');
    }
  }

  String get getDeviceToken {
    if (deviceToken != null) {
      return deviceToken!;
    } else {
      throw Exception(
          'Device token is undefined, make sure to assign value to it');
    }
  }

  // UserModel get getUserModel {
  //   return _userModel!;
  // }

  // String get currentLocale {
  //   return 'en';
  // }
}
