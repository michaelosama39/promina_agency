import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/base_login_repository.dart';
import '../data_sources/login_data_source.dart';
import '../models/user_model.dart';

class LoginRepository extends BaseLoginRepository {
  final BaseLoginDataSource baseLoginDataSource;

  LoginRepository({required this.baseLoginDataSource});

  @override
  Future<Either<Failure, UserModel>> login(
      {required String email, required String password}) async {
    try {
      final res =
          await baseLoginDataSource.login(email: email, password: password);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
