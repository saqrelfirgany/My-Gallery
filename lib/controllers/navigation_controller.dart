// import 'package:egystore/Helper/route.dart';
// import 'package:egystore/Screens/MainScreens/FavoriteScreen/favorite_screen.dart';
// import 'package:egystore/Screens/MainScreens/HomeScreen/home_screen.dart';
// import 'package:egystore/Screens/MainScreens/NotificationsScreen/notification_screen.dart';
// import 'package:egystore/Screens/MainScreens/ProfileScreen/profile_screen.dart';
// import 'package:egystore/Screens/MainScreens/TraderScreen/trader_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
//
// class NavigationController extends GetxController {
//   int index = 0;
//
//   void changeIndexFunction(int index, BuildContext context) {
//     this.index = index;
//     if (index == 0) {
//       fadNavigate(context, HomeScreen());
//     } else if (index == 1) {
//       // if (helper.token.isEmpty) {
//       //   AccountDialog(context: context);
//       //   this.index = 0;
//       //   return;
//       // }
//       fadNavigate(context, NotificationsScreen());
//     } else if (index == 2) {
//       // if (helper.token.isEmpty) {
//       //   AccountDialog(context: context);
//       //   this.index = 0;
//       //   return;
//       // }
//       fadNavigate(context, FavoriteScreen());
//     } else if (index == 3) {
//       // if (helper.token.isEmpty) {
//       //   AccountDialog(context: context);
//       //   this.index = 0;
//       //   return;
//       // }
//       fadNavigate(context, ProfileScreen());
//     } else if (index == 4) {
//       // if (helper.token.isEmpty) {
//       //   AccountDialog(context: context);
//       //   this.index = 0;
//       //   return;
//       // }
//       fadNavigate(context, TraderScreen());
//     }
//     update();
//   }
//
//   void changeIndexFunctionWithOutNotify(int index) {
//     this.index = index;
//   }
// }
