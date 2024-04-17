import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/res/app_assets.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                PositionedDirectional(
                  end: 0,
                  top: 0,
                  child: Image.asset(
                    AssetsManager.circle_1,
                  ),
                ),
                PositionedDirectional(
                  start: 0,
                  top: 0,
                  child: Image.asset(
                    AssetsManager.circle_2,
                  ),
                ),
                PositionedDirectional(
                  bottom: 0,
                  start: 0,
                  end: 0,
                  child: Image.asset(
                    AssetsManager.shadow,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height * 0.17,
            left: -(MediaQuery.sizeOf(context).width * 0.2),
            child: Image.asset(AssetsManager.headerLogin),
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height * 0.45,
            child: Row(
              children: [
                Image.asset(
                  AssetsManager.photoBottom,
                  opacity: const AlwaysStoppedAnimation(.4),
                ),
                Image.asset(
                  AssetsManager.circlesLogin,
                  opacity: const AlwaysStoppedAnimation(.4),
                ),
              ],
            ),
          ),
          // Positioned(
          //   top: MediaQuery.sizeOf(context).height * 0.04,
          //   child: Image.asset(
          //     AssetsManager.shadowImageScreen,
          //     width: MediaQuery.sizeOf(context).width,
          //     height: MediaQuery.sizeOf(context).height,
          //     fit: BoxFit.fill,
          //     opacity: const AlwaysStoppedAnimation(.14),
          //   ),
          // ),
          Positioned(
            bottom: 0,
            child: Image.asset(
              AssetsManager.shadow,
              fit: BoxFit.fill,
              width: MediaQuery.sizeOf(context).width,
            ),
          ),
        ],
      ),
    );
  }
}
