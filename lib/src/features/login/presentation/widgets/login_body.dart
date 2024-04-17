import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_agency/src/core/extensions/sized_box_helper.dart';
import '../../../../config/res/app_sizes.dart';
import '../../../../config/res/color_manager.dart';
import '../../../../core/widgets/app_text.dart';
import 'login_backround.dart';
import 'login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          const LoginBackround(),
          Column(
            children: [
              (MediaQuery.sizeOf(context).height * 0.27).szH,
              Column(
                children: [
                  AppText(
                    'My\nGellary',
                    color: ColorManager.grey,
                    fontSize: FontSize.s50,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  10.szH,
                  const LoginForm(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
