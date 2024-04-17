// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:promina_agency/src/config/res/app_sizes.dart';
import 'package:promina_agency/src/config/res/color_manager.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomAvatar extends StatelessWidget {
  final String icon;
  final Color? color;
  final Color? iconColor;
  final double? height;
  final double? width;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  const CustomAvatar({
    super.key,
    required this.icon,
    this.color,
    this.iconColor,
    this.height,
    this.width,
    this.radius,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? ColorManager.scaffoldBackground,
        borderRadius: BorderRadius.circular(radius ?? AppCircular.r8),
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.all(AppPadding.pH8),
        child: SvgPicture.asset(
          icon,
          color: iconColor,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
