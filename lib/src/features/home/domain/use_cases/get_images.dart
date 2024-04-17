import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../repositories/base_home_repository.dart';

class GetImages {
  final BaseHomeRepository baseHomeRepository;

  GetImages(this.baseHomeRepository);

  Future<Either<Failure, List<String>>> execute() async {
    return await baseHomeRepository.getImages();
  }
}
