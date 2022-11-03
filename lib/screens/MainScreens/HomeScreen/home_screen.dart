import 'package:egystore/controllers/auth_controller.dart';
import 'package:egystore/controllers/home_controller.dart';
import 'package:egystore/controllers/lang_controller.dart';
import 'package:egystore/helper/fonts_helper.dart';
import 'package:egystore/helper/helper.dart';
import 'package:egystore/screens/SharedComponents/Loaders/main_loader.dart';
import 'package:egystore/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';

import 'Body/camera_or_gallery_dialog.dart';
import 'Body/home_button.dart';
import 'Body/user_gallery.dart';
import 'Body/user_gallery_loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Get.find<Lang2Controller>().selectedLang == 'ar'
                  ? 'assets/home_background_ar.png'
                  : 'assets/home_background.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: GetBuilder<HomeController>(
            builder: (homeController) => Column(
              children: [
                SizedBox(height: 46.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GetBuilder<AuthController>(
                      builder: (authController) => SizedBox(
                        width: 250.w,
                        child: Text(
                          'welcome'.tr + '\n${Helper.userName}',
                          style: cairoW600(color: titleColor, size: 32).copyWith(height: 1.2),
                          maxLines: 2,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/user_image.png',
                      width: 66.w,
                      height: 66.w,
                    ),
                  ],
                ),
                SizedBox(height: 44.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetBuilder<AuthController>(
                      builder: (authController) => authController.loading
                          ? SizedBox(
                              width: 145.w,
                              height: 40.h,
                              child: Center(
                                child: MainLoader(),
                              ),
                            )
                          : HomeButton(
                              title: 'logout',
                              image: 'assets/icons/arrow_start.png',
                              gradientFirstColor: logoutGradientFirstColor,
                              gradientSecondColor: logoutGradientSecondColor,
                              press: () => authController.logout(),
                            ),
                    ),
                    SizedBox(width: 40.w),
                    homeController.isLoadingImage
                        ? SizedBox(
                            width: 145.w,
                            height: 40.h,
                            child: Center(
                              child: MainLoader(),
                            ),
                          )
                        : HomeButton(
                            title: 'upload',
                            image: 'assets/icons/arrow_up.png',
                            gradientFirstColor: uploadGradientFirstColor,
                            gradientSecondColor: uploadGradientSecondColor,
                            press: () {
                              ///
                              /// Camera Or Gallery Dialog
                              ///
                              showDialog(
                                context: context,
                                builder: (context) => CameraOrGalleryDialog(),
                                barrierColor: Colors.transparent,
                              );
                            },
                          ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => GetBuilder<Lang2Controller>(
                            init: Get.find<Lang2Controller>(),
                            builder: (controller) => SimpleDialog(
                              backgroundColor: Color(0xFF2F2F2F),
                              children: [
                                Text(
                                  'change-language'.tr,
                                  textAlign: TextAlign.center,
                                  style: titleStyle600(color: Colors.white),
                                ),
                                RadioListTile(
                                  value: 'ar',
                                  title: Text(
                                    'ar'.tr,
                                    style: titleStyle400(color: Colors.white),
                                  ),
                                  groupValue: controller.selectedLang,
                                  onChanged: (value) => controller.changeLang(value),
                                ),
                                RadioListTile(
                                  value: 'en',
                                  title: Text(
                                    'en'.tr,
                                    style: titleStyle400(color: Colors.white),
                                  ),
                                  groupValue: controller.selectedLang,
                                  onChanged: (value) => controller.changeLang(value),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      icon: Icon(Icons.language),
                    ),
                  ],
                ),
                SizedBox(height: 34.h),
                homeController.homeStage == HomeStage.LOADING
                    ? UserGalleryLoading()

                    ///
                    /// User Gallery
                    ///
                    : homeController.userGallery.images == null
                        ? const SizedBox()
                        : UserGallery(
                            userGalleryModel: homeController.userGallery,
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
