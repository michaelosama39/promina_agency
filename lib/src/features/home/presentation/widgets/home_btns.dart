import 'package:flutter/material.dart';
import 'package:promina_agency/src/config/res/app_sizes.dart';
import 'package:promina_agency/src/features/home/presentation/manager/home_cubit.dart';
import 'package:promina_agency/src/features/home/presentation/widgets/pick_image_dialog.dart';
import '../../../../config/res/app_assets.dart';
import 'custom_home_btn.dart';

class HomeBtns extends StatelessWidget {
  const HomeBtns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.pW18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomHomeBtn(
            text: 'log out',
            arrowImage: AssetsManager.arrowLeft,
            circleImage: AssetsManager.circleRed,
            onTap: () => HomeCubit.of(context).logout(),
          ),
          CustomHomeBtn(
            text: 'upload',
            arrowImage: AssetsManager.arrowTop,
            circleImage: AssetsManager.circleYellow,
            onTap: () => pickImageDialog(
                context: context, homeCubit: HomeCubit.of(context)),
          ),
        ],
      ),
    );
  }
}
