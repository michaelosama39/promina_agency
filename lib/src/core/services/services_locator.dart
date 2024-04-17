import 'package:get_it/get_it.dart';
import 'package:promina_agency/src/features/home/domain/repositories/base_home_repository.dart';
import 'package:promina_agency/src/features/home/domain/use_cases/get_images.dart';
import 'package:promina_agency/src/features/home/domain/use_cases/upload_image.dart';
import '../../features/home/data/data_sources/home_data_source.dart';
import '../../features/home/data/repositories/home_repository.dart';
import '../../features/home/presentation/manager/home_cubit.dart';
import '../../features/login/data/data_sources/login_data_source.dart';
import '../../features/login/data/repositories/login_repository.dart';
import '../../features/login/domain/repositories/base_login_repository.dart';
import '../../features/login/domain/use_cases/login.dart';
import '../../features/login/presentation/manager/login_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // Home
    sl.registerLazySingleton(() => UploadImage(sl()));
    sl.registerLazySingleton(() => GetImages(sl()));
    sl.registerFactory(() => HomeCubit(sl(), sl()));

    sl.registerLazySingleton<BaseHomeRepository>(
        () => HomeRepository(baseHomeDataSource: sl()));

    sl.registerLazySingleton<BaseHomeDataSource>(() => HomeDataSource());

    // login
    sl.registerLazySingleton(() => Login(sl()));
    sl.registerFactory(() => LoginCubit(sl()));

    sl.registerLazySingleton<BaseLoginRepository>(
        () => LoginRepository(baseLoginDataSource: sl()));

    sl.registerLazySingleton<BaseLoginDataSource>(() => LoginDataSource());
  }
}
