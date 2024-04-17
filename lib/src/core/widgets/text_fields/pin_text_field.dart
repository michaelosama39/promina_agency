import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promina_agency/src/config/res/app_sizes.dart';
import 'package:promina_agency/src/config/res/constans_manager.dart';
import 'package:promina_agency/src/core/extensions/sized_box_helper.dart';
import 'package:pinput/pinput.dart';

import '../../../config/res/color_manager.dart';

class CustomPinTextField extends StatelessWidget {
  final ValueChanged<String>? onCompleted;
  final TextEditingController controller;
  const CustomPinTextField(
      {super.key, required this.controller, this.onCompleted});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: AppSize.sW50,
      height: AppSize.sH60,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(AppCircular.r10),
        border: Border.all(color: Colors.grey[400]!),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: ColorManager.primaryColor),
    );
    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: ColorManager.errorColor),
    );
    return Pinput(
      length: ConstantManager.pinCodeFieldsCount,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      autofocus: true,
      separatorBuilder: (index) => 15.szW,
      focusedPinTheme: focusedPinTheme,
      defaultPinTheme: defaultPinTheme,
      errorPinTheme: errorPinTheme,
      onCompleted: onCompleted,
      controller: controller,
    );
  }
}
