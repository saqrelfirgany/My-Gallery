import 'package:egystore/helper/fonts_helper.dart';
import 'package:egystore/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.press,
    required this.title,
    this.width = 282.0,
    this.height = 46.0,
    this.radius = 10.0,
    this.background = buttonColor,
    this.textColor = Colors.white
  }) : super(key: key);
  final VoidCallback press;
  final String title;
  final double width;
  final double height;
  final double radius;
  final Color background;
  final Color textColor;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        onPrimary: textColor,
        primary: buttonColor,
        minimumSize: Size(width.w, height.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius.r)),
        ),
      ),
      onPressed: press,
      child: Text(
        title.tr,
        style: cairoW400(color: textColor),
      ),
    );
  }
}
