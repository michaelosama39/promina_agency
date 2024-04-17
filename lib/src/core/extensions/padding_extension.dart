import 'package:flutter/material.dart';

import '../../config/res/constans_manager.dart';

extension PaddingExtension on Widget {
  Widget padding(EdgeInsetsGeometry padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget paddingSymmetric({
    double? horizontal,
    double? vertical,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal ?? ConstantManager.zeroAsDouble,
        vertical: vertical ?? ConstantManager.zeroAsDouble,
      ),
      child: this,
    );
  }

  Widget paddingAll(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }

  Widget paddingLeft(double padding) {
    return Padding(
      padding: EdgeInsets.only(left: padding),
      child: this,
    );
  }

  Widget paddingRight(double padding) {
    return Padding(
      padding: EdgeInsets.only(right: padding),
      child: this,
    );
  }

  Widget paddingTop(double padding) {
    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: this,
    );
  }

  Widget paddingBottom(double padding) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding),
      child: this,
    );
  }

  Widget paddingStart(double padding) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: padding),
      child: this,
    );
  }

  Widget paddingEnd(double padding) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: padding),
      child: this,
    );
  }
}
