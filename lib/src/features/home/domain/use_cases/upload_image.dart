import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/image_service_model.dart';
import '../repositories/base_home_repository.dart';

class UploadImage {
  final BaseHomeRepository baseHomeRepository;

  UploadImage(this.baseHomeRepository);

  Future<Either<Failure, bool>> execute(ImageServiceModel imageServiceModel) async {
    return await baseHomeRepository.uploadImage(imageServiceModel);
  }
}
