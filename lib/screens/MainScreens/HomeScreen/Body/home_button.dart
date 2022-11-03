import 'package:egystore/helper/decoration_helper.dart';
import 'package:egystore/helper/fonts_helper.dart';
import 'package:egystore/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    Key? key,
    required this.gradientFirstColor,
    required this.gradientSecondColor,
    required this.image,
    required this.title,
    required this.press,
  }) : super(key: key);
  final Color gradientFirstColor;
  final Color gradientSecondColor;
  final String image;
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 145.w,
        height: 40.h,
        decoration: decorationRadius(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 8.w),
            Container(
              width: 28.w,
              height: 32.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                gradient: LinearGradient(
                  colors: [
                    gradientFirstColor,
                    gradientSecondColor,
                  ],
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                ),
              ),
              child: Image.asset(image),
            ),
            SizedBox(width: 8.w),
            Text(
              title.tr,
              style: cairoW400(color: titleColor, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}
