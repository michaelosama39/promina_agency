import 'package:flutter/material.dart';
import 'package:promina_agency/src/config/res/app_sizes.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../config/res/color_manager.dart';


class CustomLoading {
  static showLoadingView() {
    return Center(
      child: SpinKitDoubleBounce(
        color: ColorManager.primaryColor,
        size: AppSize.sH40,
      ),
    );
  }

  static showLoadingDialog() {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
      indicator: SizedBox(
        height: AppSize.sH60,
        width: AppSize.sW60,
        child: const SpinKitFadingCircle(color: ColorManager.primaryColor),
      ),
      dismissOnTap: false,
      status: "Loading..",
    );
  }

  static dismissLoading({Color? color}) {
    return EasyLoading.dismiss();
  }
}
