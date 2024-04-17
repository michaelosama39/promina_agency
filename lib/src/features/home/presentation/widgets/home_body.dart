import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_agency/src/core/extensions/seperator_helper.dart';
import 'package:promina_agency/src/core/extensions/sized_box_helper.dart';
import 'home_background.dart';
import 'home_btns.dart';
import 'home_header.dart';
import 'list_of_images_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const HomeBackground(),
        Container(
          padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height * 0.04,
              left: MediaQuery.sizeOf(context).width * 0.07,
              right: MediaQuery.sizeOf(context).width * 0.07,
              bottom: MediaQuery.sizeOf(context).width * 0.03),
          child: Column(
            children: [
              const HomeHeader(),
              const HomeBtns(),
              const ListOfImagesWidget(),
            ].joinWith((MediaQuery.sizeOf(context).height * 0.05).szH),
          ),
        ),
      ],
    );
  }
}
