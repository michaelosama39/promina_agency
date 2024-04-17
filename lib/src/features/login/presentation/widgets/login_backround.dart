import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/res/app_assets.dart';

class LoginBackround extends StatelessWidget {
  const LoginBackround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  AssetsManager.shadow,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -(MediaQuery.sizeOf(context).height * 0.02),
          left: -(MediaQuery.sizeOf(context).width * 0.23),
          child: Image.asset(AssetsManager.headerLogin),
        ),
        Positioned(
          top: MediaQuery.sizeOf(context).height * 0.13,
          left: (MediaQuery.sizeOf(context).width * 0.14),
          child: Image.asset(AssetsManager.lovePhotography),
        ),
      ],
    );
  }
}
