import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_agency/src/config/res/app_sizes.dart';
import 'package:promina_agency/src/core/extensions/sized_box_helper.dart';
import '../../../../config/res/color_manager.dart';
import '../../../../core/widgets/app_text.dart';

class CustomHomeBtn extends StatelessWidget {
  const CustomHomeBtn(
      {Key? key,
      required this.text,
      required this.arrowImage,
      required this.circleImage,
      required this.onTap})
      : super(key: key);
  final String text;
  final String arrowImage;
  final String circleImage;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.06,
        width: MediaQuery.sizeOf(context).width * 0.38,
        padding: EdgeInsets.symmetric(horizontal: AppPadding.pW10, vertical: AppPadding.pH4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              ColorManager.whiteColor.withOpacity(0.57),
              ColorManager.whiteColor.withOpacity(0.43),
            ],
          ),
        ),
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  circleImage,
                  width: 32.w,
                  height: 29.h,
                  opacity: const AlwaysStoppedAnimation(.4),
                ),
                Positioned(
                  left: 6.w,
                  child: Container(
                    width: 32.w,
                    height: 29.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(circleImage),
                      ),
                    ),
                    child: Image.asset(
                      arrowImage,
                      width: 32.w,
                      height: 29.h,
                    ),
                  ),
                ),
              ],
            ),
            15.szW,
            AppText(
              text,
              color: ColorManager.grey,
              fontSize: 20,
            ),
          ],
        ),
      ),
    );
  }
}
