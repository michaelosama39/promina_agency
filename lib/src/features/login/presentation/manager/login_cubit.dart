import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina_agency/src/config/res/constans_manager.dart';
import 'package:promina_agency/src/core/navigation/navigator.dart';
import '../../../../config/res/enums.dart';
import '../../../../core/helpers/cache_service.dart';
import '../../../../core/shared/global_user_data.dart';
import '../../../../core/widgets/buttons/custom_animated_button.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../../data/models/user_model.dart';
import '../../domain/use_cases/login.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginState());

  static LoginCubit of(context) => BlocProvider.of(context);
  final Login loginUseCase;

  final formKey = GlobalKey<FormState>();
  final btnKey = GlobalKey<CustomButtonState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginState(loginState: RequestState.loading));
      btnKey.currentState!.animateForward();
      final res = await loginUseCase.execute(
          email: emailController.text, password: passwordController.text);
      btnKey.currentState!.animateReverse();
      res.fold(
        (failure) {
          emit(LoginState(
              loginState: RequestState.error, message: failure.message));
          showSnackBar(failure.message);
        },
        (res) async {
          emit(LoginState(loginState: RequestState.success, userModel: res));
          CacheStorage.write(ConstantManager.token, res.token!);
          CacheStorage.write('name', res.user!.name ?? '');
          Go.offAll(const HomeScreen());
        },
      );
    }
  }
}
