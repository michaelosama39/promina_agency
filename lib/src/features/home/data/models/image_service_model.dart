import 'dart:io';

import 'package:dio/dio.dart';

class ImageServiceModel {
  final File image;

  ImageServiceModel({required this.image});

  Future<Map<String, dynamic>> toJson() async {
    final Map<String, dynamic> data = {};
    data['img'] = await MultipartFile.fromFile(image.path,
        filename: image.path.split('/').last);
    print(data['img']);
    return data;
  }
}
