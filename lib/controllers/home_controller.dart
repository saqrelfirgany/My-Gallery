import 'dart:io';

import 'package:dio/dio.dart';
import 'package:egystore/constants/app_constants.dart';
import 'package:egystore/helper/dio_helper.dart';
import 'package:egystore/models/user_gallery.dart';
import 'package:egystore/screens/SharedComponents/getsnack_bars.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

enum HomeStage { Normal, ERROR, LOADING, DONE }

class HomeController extends GetxController {
  HomeStage homeStage = HomeStage.Normal;

  @override
  void onInit() {
    super.onInit();
    getSlider();
  }

  ///
  /// Gallery
  ///
  UserGalleryModel _userGallery = UserGalleryModel();

  UserGalleryModel get userGallery => _userGallery;

  Future<void> getSlider() async {
    homeStage = HomeStage.LOADING;
    dynamic response = await DioHelper.get(url: AppConstants.userGalleryEndPoint);
    if (response == null || response == false) {
      homeStage = HomeStage.ERROR;
      update();
      return;
    } else {
      _userGallery = UserGalleryModel.fromJson(response['data']);
      homeStage = HomeStage.DONE;
      update();
    }
  }

  bool isLoadingImage = false;

  final ImagePicker _picker = ImagePicker();
  File? imageFile;

  Future<void> getImage(ImageSource source) async {
    await _picker
        .pickImage(source: source, maxWidth: 400.0, maxHeight: 800, imageQuality: 70)
        .then((image) async {
      if (image != null) {
        Navigator.pop(getx.Get.context!);
        isLoadingImage = true;
        update();
        File imageFile = File(image.path);
        String fileName = imageFile.path.split('/').last;
        FormData formData = FormData.fromMap({
          "img": await MultipartFile.fromFile(imageFile.path, filename: fileName),
        });
        dynamic response = await DioHelper.post(url: AppConstants.uploadEndPoint, data: formData);
        if (response == null || response == false) {
          isLoadingImage = false;
          update();
          return;
        } else {
          await getSlider();
          isLoadingImage = false;
          update();
          showSuccess(body: response['message']);
        }
      }
    });
  }
}
