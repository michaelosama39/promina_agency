import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/res/color_manager.dart';
import '../../../../core/services/services_locator.dart';
import '../manager/login_cubit.dart';
import '../widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(sl()),
      child: Scaffold(
        backgroundColor: ColorManager.pink.withOpacity(0.2),
        body: const LoginBody(),
      ),
    );
  }
}
