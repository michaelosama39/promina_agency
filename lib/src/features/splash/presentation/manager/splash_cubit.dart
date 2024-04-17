import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:promina_agency/src/core/navigation/navigator.dart';
import 'package:promina_agency/src/features/home/presentation/pages/home_screen.dart';
import 'package:promina_agency/src/features/login/presentation/pages/login_screen.dart';

import '../../../../config/res/constans_manager.dart';
import '../../../../core/helpers/cache_service.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  static SplashCubit of(context) => BlocProvider.of(context);

  splashTimer() {
    Timer(const Duration(seconds: 2), () {
      if (CacheStorage.read(ConstantManager.token) != null) {
        Go.offAll(const HomeScreen());
      } else {
        Go.to(const LoginScreen());
      }
    });
  }
}
