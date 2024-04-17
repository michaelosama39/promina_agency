import 'package:dio/dio.dart';
import 'package:promina_agency/src/features/login/data/models/user_model.dart';
import '../../config/res/constans_manager.dart';
import '../error/exception.dart';
import '../helpers/cache_service.dart';
import 'api_names.dart';
import 'logger_interceptor.dart';

class DioHelper {
  static Dio dioSingleton = Dio()
    ..options = BaseOptions(
      baseUrl: ApiNames.baseUrl,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    )
    ..interceptors.add(LoggerInterceptor());

  static Future<Response<dynamic>> post({
    required String path,
    FormData? formData,
    Map<String, dynamic>? body,
  }) {
    dioSingleton.options.headers
        .addAll({"authorization": "Bearer ${CacheStorage.read(ConstantManager.token)}"});
    return dioSingleton.post(path,
        data: formData ?? body,
        options: Options(
          validateStatus: (_) => true,
          responseType: ResponseType.json,
        ));
  }

  static Future<Response<dynamic>> get({required String path}) {
    dioSingleton.options.headers
        .addAll({"authorization": "Bearer ${CacheStorage.read(ConstantManager.token)}"});
    return dioSingleton.get(path);
  }

  static handleError(dynamic error) {
    if (error['error_message'] != null) {
      throw FetchDataException(error['error_message']);
    }
  }
}
