import 'package:flutter/material.dart';
import '../../config/res/color_manager.dart';
import '../navigation/navigator.dart';

void showSnackBar(String message, {Color? backgroundColor}) {
  final snackBar = SnackBar(
    duration: const Duration(seconds: 2),
    content: Text(message),
    backgroundColor: backgroundColor ?? ColorManager.blackColor.withOpacity(.5),
    behavior: SnackBarBehavior.floating,
    elevation: 4,
    action: SnackBarAction(
      label: 'cancele',
      disabledTextColor: Colors.white,
      textColor: Colors.white,
      onPressed: () => ScaffoldMessenger.of(Go.navigatorKey.currentContext!)
          .clearSnackBars(),
    ),
  );
  ScaffoldMessenger.of(Go.navigatorKey.currentContext!).showSnackBar(snackBar);
}
