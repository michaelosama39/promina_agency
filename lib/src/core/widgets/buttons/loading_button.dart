import 'package:flutter/material.dart';
import 'package:promina_agency/src/config/res/color_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../config/res/app_sizes.dart';
import 'custom_animated_button.dart';

class LoadingButton extends StatelessWidget {
  final GlobalKey<CustomButtonState> btnKey;
  final String title;
  final Function() onTap;
  final Color? textColor;
  final Color? color;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;

  const LoadingButton({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
    this.textColor,
    this.borderRadius,
    this.margin,
    this.borderColor,
    this.fontFamily,
    this.fontSize,
    this.width,
    this.height,
    this.fontWeight,
    required this.btnKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ??
          EdgeInsets.symmetric(
            horizontal: AppMargin.mW10,
            vertical: AppMargin.mH10,
          ),
      child: CustomButtonAnimation(
        key: btnKey,
        onTap: onTap,
        width: width ?? MediaQuery.of(context).size.width,
        minWidth: AppSize.sW50,
        height: height ?? AppSize.sH46,
        color: color ?? ColorManager.primaryColor,
        borderRadius: borderRadius ?? AppSize.sH10,
        disabledColor: color ?? ColorManager.primaryColor,
        borderSide: borderColor != null
            ? const BorderSide(color: ColorManager.primaryColor, width: 1)
            : BorderSide.none,
        loader: Container(
          padding: EdgeInsets.all(AppPadding.pH10),
          child: SpinKitFoldingCube(
            color: Colors.white,
            size: AppSize.sH20,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: fontSize ?? FontSize.s18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
