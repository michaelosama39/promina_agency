import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_agency/src/config/res/app_assets.dart';
import 'package:promina_agency/src/config/res/app_sizes.dart';
import 'package:promina_agency/src/config/res/color_manager.dart';
import 'package:promina_agency/src/core/extensions/seperator_helper.dart';
import 'package:promina_agency/src/core/extensions/sized_box_helper.dart';
import 'package:promina_agency/src/features/home/presentation/manager/home_cubit.dart';

import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_dialog.dart';

pickImageDialog({required BuildContext context, required HomeCubit homeCubit}) {
  showCustomDialog(
    context,
    color: ColorManager.whiteColor.withOpacity(0.4),
    child: BlocProvider.value(
      value: homeCubit,
      child: const PickImageWidget(),
    ),
  );
}

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppPadding.pH20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => HomeCubit.of(context).pickImage(PickImage.gallery),
            child: Image.asset(
              AssetsManager.galleryImg,
              width: 184.w,
              height: 65.h,
            ),
          ),
          InkWell(
            onTap: () => HomeCubit.of(context).pickImage(PickImage.camera),
            child: Image.asset(
              AssetsManager.cameraImg,
              width: 184.w,
              height: 65.h,
            ),
          ),
        ].joinWith(40.szH),
      ),
    );
  }
}
