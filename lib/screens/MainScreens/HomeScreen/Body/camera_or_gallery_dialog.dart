import 'dart:ui';

import 'package:egystore/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:image_picker/image_picker.dart';

import 'camera_or_gallery_button.dart';

class CameraOrGalleryDialog extends StatelessWidget {
  const CameraOrGalleryDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        clipBehavior: Clip.hardEdge,
        contentPadding: EdgeInsets.zero,
        content: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              width: 220.w,
              // height: 220.w,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white30, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 40.h),
                  CameraOrGalleryButton(
                    title: 'gellary',
                    image: 'assets/icons/gallery.png',
                    press: () => Get.find<HomeController>().getImage(ImageSource.gallery),
                  ),
                  SizedBox(height: 44.h),
                  CameraOrGalleryButton(
                    title: 'camera',
                    image: 'assets/icons/3.png',
                    imageWidth: 56,
                    imageHeight: 58,
                    containerPadding: 0,
                    imagePadding: 0,
                    press: () => Get.find<HomeController>().getImage(ImageSource.camera),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
