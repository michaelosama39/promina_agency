import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/user_model.dart';
import '../repositories/base_login_repository.dart';

class Login {
  final BaseLoginRepository baseLoginRepository;

  Login(this.baseLoginRepository);

  Future<Either<Failure, UserModel>> execute(
      {required String email, required String password}) async {
    return await baseLoginRepository.login(email: email, password: password);
  }
}
