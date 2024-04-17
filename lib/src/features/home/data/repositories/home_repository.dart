import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/base_home_repository.dart';
import '../data_sources/home_data_source.dart';
import '../models/image_service_model.dart';

class HomeRepository extends BaseHomeRepository {
  final BaseHomeDataSource baseHomeDataSource;

  HomeRepository({required this.baseHomeDataSource});

  @override
  Future<Either<Failure, List<String>>> getImages() async {
    try {
      final res = await baseHomeDataSource.getImages();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> uploadImage(ImageServiceModel imageServiceModel) async{
    try {
      final res = await baseHomeDataSource.uploadImage(imageServiceModel);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
