import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../core/network/api_names.dart';
import '../../../../core/network/dio_helper.dart';
import '../models/image_service_model.dart';

abstract class BaseHomeDataSource {
  Future<List<String>> getImages();

  Future<bool> uploadImage(ImageServiceModel imageServiceModel);
}

class HomeDataSource extends BaseHomeDataSource {
  @override
  Future<List<String>> getImages() async {
    final response = await DioHelper.get(
      path: ApiNames.myGallery,
    );
    if (response.data['status'] == 'success') {
      List<String> list = [];
      for (var element in response.data['data']['images'] as List) {
        list.add(element.toString());
      }
      return list;
    } else {
      return DioHelper.handleError(response.data);
    }
  }

  @override
  Future<bool> uploadImage(ImageServiceModel imageServiceModel) async {
    final response = await DioHelper.post(
      path: ApiNames.upload,
      formData: FormData.fromMap(await imageServiceModel.toJson()),
    );
    if (response.data['status'] == 'success') {
      return true;
    } else {
      return DioHelper.handleError(response.data);
    }
  }
}
