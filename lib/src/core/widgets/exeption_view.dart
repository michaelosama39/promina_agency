import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:promina_agency/src/config/res/app_assets.dart';
 import 'package:lottie/lottie.dart';

import '../../config/language/locale_keys.g.dart';
import '../../config/res/app_sizes.dart';
import '../../config/res/color_manager.dart';
import 'buttons/default_button.dart';

class ExceptionView extends StatelessWidget {
  const ExceptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            LottieManager.error,
            width: MediaQuery.of(context).size.width * .7,
            height: MediaQuery.of(context).size.height * .3,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: AppMargin.mH20),
            child: Center(
              child: Text(LocaleKeys.expetion.tr()),
            ),
          ),
          DefaultButton(
            width: MediaQuery.of(context).size.width * .45,
            title: LocaleKeys.contact_us.tr(),
            textColor: ColorManager.buttonTextColor,
            fontSize: FontSize.s12,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
