import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/user_model.dart';

abstract class BaseLoginRepository {
  Future<Either<Failure, UserModel>> login({required String email, required String password});
}
