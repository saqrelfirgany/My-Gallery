import 'package:egystore/controllers/auth_controller.dart';
import 'package:egystore/controllers/home_controller.dart';
import 'package:egystore/controllers/lang_controller.dart';
import 'package:get/get.dart';

Future<void> init() async {
  ///
  /// SharedPreferences
  ///
  // final sharedPreferences = await SharedPreferences.getInstance();
  // Get.lazyPut(() => sharedPreferences, fenix: true);

  ///
  /// API Client
  ///
  // Get.lazyPut(
  //   () => ApiClient(
  //     appBaseUrl: AppConstants.baseUrl,
  //     sharedPreferences: Get.find(),
  //   ),
  // );

  ///
  /// Controller
  ///

  Get.lazyPut(() => Lang2Controller(), fenix: true);
  Get.lazyPut(() => AuthController(), fenix: true);
  Get.lazyPut(() => HomeController(), fenix: true);
}
