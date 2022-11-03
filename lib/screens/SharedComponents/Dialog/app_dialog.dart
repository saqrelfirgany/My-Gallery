import 'dart:ui';

import 'package:egystore/Helper/decoration_helper.dart';
import 'package:egystore/Helper/fonts_helper.dart';
import 'package:egystore/helper/route.dart';
import 'package:egystore/screens/IntroScreens/LoginScreen/body/app_button.dart';
import 'package:egystore/screens/MainScreens/HomeScreen/home_screen.dart';
import 'package:egystore/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import 'animated_dialog.dart';

void AppDialog({required BuildContext? context}) {
  showAnimatedDialog(
    context!,
    RotatedRDialog(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            width: 388.w,
            height: 414.h,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(32.r),
              border: Border.all(color: Colors.white30, width: 2),
            ),
            child: Column(
              children: [
                SizedBox(height: 48.h),
                Text('Log in', style: cairoW600(color: titleColor, size: 30)),
                SizedBox(height: 38.h),
                // AppFormField(),
                SizedBox(height: 38.h),
                // AppFormField(),
                SizedBox(height: 38.h),
                AppButton(
                  press: () => fadNavigate(context, HomeScreen()),
                  title: 'Submit',
                )
              ],
            ),
          ),
        ),
      ),
    ),
    isFlip: true,
  );
}