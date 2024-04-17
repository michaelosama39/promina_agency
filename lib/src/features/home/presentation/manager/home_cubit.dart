import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina_agency/src/config/res/app_fun.dart';
import 'package:promina_agency/src/core/navigation/navigator.dart';
import 'package:promina_agency/src/core/widgets/custom_loading.dart';
import 'package:promina_agency/src/features/home/domain/use_cases/get_images.dart';
import 'package:promina_agency/src/features/home/domain/use_cases/upload_image.dart';
import 'package:promina_agency/src/features/login/presentation/pages/login_screen.dart';
import '../../../../config/res/constans_manager.dart';
import '../../../../config/res/enums.dart';
import '../../../../core/helpers/cache_service.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../../data/models/image_service_model.dart';

part 'home_state.dart';

enum PickImage { camera, gallery }

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.getImagesUseCase, this.uploadImageUseCase)
      : super(HomeInitial());
  final GetImages getImagesUseCase;
  final UploadImage uploadImageUseCase;

  static HomeCubit of(context) => BlocProvider.of(context);

  String getUserName() => CacheStorage.read('name');

  initData() {
    _getImages();
  }

  logout() {
    CacheStorage.remove(ConstantManager.token);
    Go.offAll(const LoginScreen());
  }

  _getImages() async {
    emit(GetImageState(requestState: RequestState.loading));
    final res = await getImagesUseCase.execute();

    res.fold(
      (failure) {
        emit(GetImageState(
            requestState: RequestState.error, message: failure.message));
        showSnackBar(failure.message);
      },
      (res) async {
        emit(GetImageState(requestState: RequestState.success, images: res));
      },
    );
  }

  pickImage(PickImage pickImage) async {
    File? file;
    if (pickImage == PickImage.gallery) {
      file = await AppFun.getImageFromGallery();
    } else {
      file = await AppFun.getImageFromCamera();
    }
    Go.back();
    CustomLoading.showLoadingDialog();
    if (file != null) {
      ImageServiceModel imageServiceModel = ImageServiceModel(image: file);
      emit(UploadImageState(requestState: RequestState.loading));
      final res = await uploadImageUseCase.execute(imageServiceModel);
      res.fold(
        (failure) {
          emit(UploadImageState(
              requestState: RequestState.error, message: failure.message));
          showSnackBar(failure.message);
        },
        (res) async {
          CustomLoading.dismissLoading();
          emit(UploadImageState(requestState: RequestState.success));
          _getImages();
        },
      );
    }
  }
}
