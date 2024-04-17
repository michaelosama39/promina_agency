import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina_agency/src/features/home/presentation/manager/home_cubit.dart';
import 'package:promina_agency/src/features/home/presentation/widgets/home_body.dart';
import '../../../../config/res/color_manager.dart';
import '../../../../core/services/services_locator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(sl(), sl())..initData(),
      child: const Scaffold(
        backgroundColor: ColorManager.pinkLight,
        body: HomeBody(),
      ),
    );
  }
}
