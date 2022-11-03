import 'package:egystore/helper/decoration_helper.dart';
import 'package:egystore/helper/fonts_helper.dart';
import 'package:egystore/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CameraOrGalleryButton extends StatelessWidget {
  const CameraOrGalleryButton({
    Key? key,
    required this.title,
    required this.image,
    required this.press,
    this.imageWidth = 32,
    this.imageHeight= 32,
    this.containerPadding= 16,
    this.imagePadding= 6,
  }) : super(key: key);
  final String title;
  final String image;
  final VoidCallback press;
  final double imageWidth;
  final double imageHeight;
  final double containerPadding;
  final double imagePadding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 184.w,
        height: 65.h,
        padding: EdgeInsets.symmetric(horizontal: containerPadding.w),
        decoration: decorationRadius(color: gellaryButtonColor, radius: 20),
        child: Center(
          child: Row(
            children: [
              Image.asset(
                image,
                width: imageWidth.w,
                height: imageHeight.w,
                fit: BoxFit.fill,
              ),
              SizedBox(width: imagePadding.w),
              Text(
                title.tr,
                style: cairoW600(color: titleColor, size: 27),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
