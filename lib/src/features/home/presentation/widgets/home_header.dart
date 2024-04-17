import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_agency/src/core/extensions/sized_box_helper.dart';

import '../../../../config/res/app_assets.dart';
import '../../../../config/res/app_sizes.dart';
import '../../../../config/res/color_manager.dart';
import '../../../../core/widgets/app_text.dart';
import '../manager/home_cubit.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AppText(
            HomeCubit.of(context).getUserName(),
            fontSize: FontSize.s32,
            color: ColorManager.grey,
          ),
        ),
        (MediaQuery.sizeOf(context).width * 0.1).szW,
        Image.asset(AssetsManager.avater),
      ],
    );
  }
}
