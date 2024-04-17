import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/image_service_model.dart';

abstract class BaseHomeRepository {
  Future<Either<Failure, List<String>>> getImages();
  Future<Either<Failure, bool>> uploadImage(ImageServiceModel imageServiceModel);
}
