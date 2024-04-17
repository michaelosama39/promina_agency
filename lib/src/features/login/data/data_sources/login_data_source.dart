import '../../../../core/error/error_message_model.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/network/api_names.dart';
import '../../../../core/network/dio_helper.dart';
import '../models/user_model.dart';

abstract class BaseLoginDataSource {
  Future<UserModel> login({required String email, required String password});
}

class LoginDataSource extends BaseLoginDataSource {
  @override
  Future<UserModel> login(
      {required String email, required String password}) async {
    final response = await DioHelper.post(
      path: ApiNames.login,
      body: {
        'email': email,
        'password': password,
      },
    );
    if (response.data['token'] != null) {
      return UserModel.fromJson(response.data);
    } else {
      return _handleError(response.data);
    }
  }

  _handleError(dynamic error) {
    if (error['error_message'] != null) {
      throw FetchDataException(error['error_message']);
    }
  }
}
