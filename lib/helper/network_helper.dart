// import 'package:cashier/helper/variables.dart';
// import 'package:cashier/ui/components.dart';
// import 'package:connectivity/connectivity.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
//
// class NetworkHelper {
//   /// Init network
//   static Future init() async {
//     /// Listen to connection changes
//     Connectivity()
//         .onConnectivityChanged
//         .listen((ConnectivityResult result) async => await check());
//
//     /// Set connection status
//     GlobalVariables.isDeviceConnectedToTheInternet.value =
//         (await Connectivity().checkConnectivity() != ConnectivityResult.none);
//   }
//
//   /// Check connection
//   static Future check() async {
//     var listener = InternetConnectionChecker().onStatusChange.listen((status) {
//       switch (status) {
//         case InternetConnectionStatus.connected:
//           /// Show snak bar
//           // Get.snackbar('Network connection'.tr,
//           //     'You are connected to the internet.'.tr + ' ' + 'Loading...'.tr);
//           GlobalVariables.isDeviceConnectedToTheInternet.value = true;
//           // MainLoader.set(false);
//           break;
//         case InternetConnectionStatus.disconnected:
//           /// Show snak bar
//           // getSnackBar2(message: 'error-internet');
//           GlobalVariables.isDeviceConnectedToTheInternet.value = false;
//           // MainLoader.set(true);
//           break;
//       }
//     });
//
//     /// close listener after 15 seconds, so the program doesn't run forever
//     await Future.delayed(Duration(seconds: 15));
//     await listener.cancel();
//   }
// }
