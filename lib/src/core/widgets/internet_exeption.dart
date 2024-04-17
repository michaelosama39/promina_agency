import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:promina_agency/src/config/res/app_assets.dart';
import 'package:promina_agency/src/config/res/color_manager.dart';
import 'package:promina_agency/src/core/extensions/context_extension.dart';
import 'package:lottie/lottie.dart';
import '../../config/language/locale_keys.g.dart';
import '../../config/res/app_sizes.dart';

class InternetExpetion extends StatelessWidget {
  const InternetExpetion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.mediaQuery.size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              LottieManager.noInternet,
              width: MediaQuery.of(context).size.width * .7,
              height: MediaQuery.of(context).size.height * .3,
            ),
            SizedBox(height: AppSize.sH10),
            Text(
              LocaleKeys.errorExeptionNoconnection.tr(),
              style: context.textTheme.titleLarge!.copyWith(
                color: ColorManager.secondryColor,
              ),
            ),
            SizedBox(height: AppSize.sH10),
            Text(
              LocaleKeys.errorExeption_NointernetDesc.tr(),
              style: context.textTheme.titleLarge!.copyWith(),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSize.sH10),
          ],
        ),
      ),
    );
  }
}
