import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina_agency/src/features/splash/presentation/manager/splash_cubit.dart';
import 'package:promina_agency/src/features/splash/presentation/widgets/splash_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => SplashCubit()..splashTimer(),
      child: const Scaffold(
        body: SplashBody(),
      ),
    );
  }
}
