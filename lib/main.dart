import 'package:egystore/screens/IntroScreens/SplashScreen/splash_screen.dart';
import 'package:egystore/theme/theme.dart';
import 'package:egystore/utils/langs/translation.dart';
import 'package:egystore/utils/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Helper/dio_helper.dart';
import 'controllers/lang_controller.dart';
import 'dependencies/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  await GetStorage.init();
  // await NetworkHelper.init();
  await DioHelper.init();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, widget) => GetBuilder<Lang2Controller>(
        builder: (controller) => GetMaterialApp(
          builder: (context, widget) {
            //add this line
            // ScreenUtil.setContext(context);
            return MediaQuery(
              //Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
          debugShowCheckedModeBanner: false,
          title: 'EgyStore',
          theme: Themes.light,
          darkTheme: Themes.dark,
          themeMode: LocalStorage().theme,
          translations: Translation(),
          locale: Locale(controller.selectedLang),
          fallbackLocale: Locale(controller.selectedLang),
          home: SplashScreen(),
        ),
      ),
    );
  }
}