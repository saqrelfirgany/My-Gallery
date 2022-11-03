import 'package:egystore/Helper/route.dart';
import 'package:egystore/helper/dio_helper.dart';
import 'package:egystore/helper/helper.dart';
import 'package:egystore/screens/IntroScreens/LoginScreen/login_screen.dart';
import 'package:egystore/screens/MainScreens/HomeScreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  void _animationState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _animationState();
    getData();
    Future.delayed(const Duration(seconds: 2), () {
      navigateTo();
    });
  }

  Future navigateTo() async {
    Helper.isLoggedIn = await Helper.getUserLoggedInSharedPreferences();
    Helper.token = await Helper.getUserTokenInSharedPreferences();
    if (Helper.token.isNotEmpty && Helper.isLoggedIn) {
      Helper.userName = await Helper.getUserNameInSharedPreferences();
      await DioHelper.init();
      fadNavigate(context, HomeScreen());
    } else {
      fadNavigate(context, LoginScreen());
    }
  }

  Future getData() async {
    await DioHelper.init();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
        child: ScaleTransition(
          scale: _animation,
          child: Center(
            child: Image.asset(
              "assets/splash_logo.png",
              width: 228.w,
              height: 228.h,
            ),
          ),
        ),
      ),
    );
  }
}
