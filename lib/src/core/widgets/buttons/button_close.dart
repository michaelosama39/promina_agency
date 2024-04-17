import 'package:flutter/material.dart';
import 'package:promina_agency/src/config/res/app_sizes.dart';
import '../../navigation/navigator.dart';
import '../../../config/res/color_manager.dart';

class ButtonClose extends StatelessWidget {
  final VoidCallback? onTap;

  const ButtonClose({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Go.back(),
      child: Container(
        height: AppSize.sH25,
        width: AppSize.sW25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppCircular.r20),
        ),
        child: Center(
          child: Icon(
            Icons.close,
            color: ColorManager.blackColor,
            size: AppSize.sH25,
          ),
        ),
      ),
    );
  }
}
