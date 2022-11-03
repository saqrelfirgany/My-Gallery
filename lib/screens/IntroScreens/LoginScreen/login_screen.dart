import 'dart:ui';

import 'package:egystore/controllers/auth_controller.dart';
import 'package:egystore/helper/fonts_helper.dart';
import 'package:egystore/helper/route.dart';
import 'package:egystore/screens/MainScreens/HomeScreen/home_screen.dart';
import 'package:egystore/screens/SharedComponents/Loaders/main_loader.dart';
import 'package:egystore/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';

import 'body/app_button.dart';
import 'body/form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 216.h),
              Text(
                'My\nGellary',
                style: cairoW600(color: titleColor, size: 50).copyWith(height: 1),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              ClipRect(
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
                        Text('logIn'.tr, style: cairoW600(color: titleColor, size: 30)),
                        SizedBox(height: 38.h),
                        AppFormField(
                          controller: Get.find<AuthController>().userNameController,
                          hint: 'userName',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 38.h),
                        AppFormField(
                          controller: Get.find<AuthController>().passwordController,
                          hint: 'password',
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        SizedBox(height: 38.h),
                        GetBuilder<AuthController>(
                          builder: (authController) => authController.loading
                              ? SizedBox(
                                  width: 282.w,
                                  height: 46.h,
                                  child: Center(
                                    child: MainLoader(),
                                  ),
                                )
                              : AppButton(
                                  press: () => authController.login(),
                                  title: 'submit',
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
