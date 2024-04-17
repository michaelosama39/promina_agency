import 'package:flutter/material.dart';
import 'package:promina_agency/src/config/res/app_sizes.dart';
import 'package:promina_agency/src/config/res/constans_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../config/res/color_manager.dart';
import '../navigation/navigator.dart';
import 'app_text.dart';

class MessageUtils {
  static void showSnackBar(
    String message, {
    Color? backgroundColor,
    BuildContext? context,
  }) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: ConstantManager.snackbarDuration),
      content: AppText(message, color: ColorManager.whiteColor),
      backgroundColor: backgroundColor ?? ColorManager.whiteColor,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context ?? Go.navigatorKey.currentContext!)
        .showSnackBar(snackBar);
  }

  static void showSimpleToast({
    required String msg,
    Color? color,
    Color? textColor,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: color ?? ColorManager.primaryColor,
      textColor: textColor ?? ColorManager.whiteColor,
      fontSize: FontSize.s16,
    );
  }
}
