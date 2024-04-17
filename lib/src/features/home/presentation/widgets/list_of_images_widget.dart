import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_agency/src/core/widgets/custom_shimmer.dart';
import 'package:promina_agency/src/core/widgets/image_widgets/cached_image.dart';
import 'package:promina_agency/src/features/home/presentation/manager/home_cubit.dart';
import '../../../../config/res/enums.dart';

class ListOfImagesWidget extends StatelessWidget {
  const ListOfImagesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is GetImageState &&
              state.requestState == RequestState.success) {
            return GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.images!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20.w,
                mainAxisSpacing: 20.h,
              ),
              itemBuilder: (context, index) {
                return CachedImage(
                  url: state.images![index],
                  width: 108.w,
                  height: 108.h,
                  borderRadius: BorderRadius.circular(20.r),
                );
              },
            );
          } else if (state is GetImageState &&
              state.requestState == RequestState.loading) {
            return GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: 7,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20.w,
                mainAxisSpacing: 20.h,
              ),
              itemBuilder: (context, index) {
                return CustomShimmer(
                  width: 108.w,
                  height: 108.h,
                  borderRadius: BorderRadius.circular(20.r),
                );
              },
            );
          }else{
            return  const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
