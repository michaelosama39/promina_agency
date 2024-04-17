import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_agency/src/core/extensions/sized_box_helper.dart';
import 'package:promina_agency/src/core/extensions/validator.dart';

import '../../../../config/res/app_assets.dart';
import '../../../../config/res/app_sizes.dart';
import '../../../../config/res/color_manager.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/buttons/loading_button.dart';
import '../../../../core/widgets/text_fields/custom_text_field.dart';
import '../manager/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.symmetric(horizontal: AppMargin.mW20),
      padding: EdgeInsets.only(
        top: AppPadding.pH20,
        bottom: AppPadding.pH40,
        left: AppPadding.pW20,
        right: AppPadding.pW20,
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AssetsManager.photoBottom,
                      scale: 1.3),
                  Image.asset(AssetsManager.circlesLogin,
                      scale: 1.3),
                ],
              ),
              Image.asset(AssetsManager.photoLeft, scale: 1.3),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: AppPadding.pH20,
                horizontal: AppPadding.pW20),
            decoration: BoxDecoration(
              color: ColorManager.whiteColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(32.r),
            ),
            child: Form(
              key: LoginCubit.of(context).formKey,
              child: Column(
                children: [
                  AppText(
                    'Log in',
                    color: ColorManager.grey,
                    fontSize: FontSize.s30,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  20.szH,
                  CustomTextField(
                    hint: 'User Name',
                    type: TextInputType.text,
                    action: TextInputAction.next,
                    controller:
                    LoginCubit.of(context).emailController,
                    validate: (value) =>
                        value!.validateEmpty(context),
                  ),
                  10.szH,
                  CustomTextField(
                    hint: 'Password',
                    type: TextInputType.text,
                    action: TextInputAction.next,
                    fieldTypes: FieldTypes.password,
                    controller:
                    LoginCubit.of(context).passwordController,
                    validate: (value) =>
                        value!.validatePassword(context),
                  ),
                  10.szH,
                  LoadingButton(
                    title: 'Submit',
                    btnKey: LoginCubit.of(context).btnKey,
                    onTap: () => LoginCubit.of(context).login(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
