import 'package:egystore/helper/decoration_helper.dart';
import 'package:egystore/helper/fonts_helper.dart';
import 'package:egystore/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class AppFormField extends StatelessWidget {
  const AppFormField({
    Key? key,
    required this.controller,
    required this.hint,
    required this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);
  final TextEditingController controller;
  final String hint;
  final TextInputType keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 282.w,
      height: 46.h,
      decoration: decorationRadius(color: formFieldColor, radius: 22),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          hintText: hint.tr,
          hintStyle: cairoW400(color: hintColor),
          contentPadding: EdgeInsetsDirectional.only(
            start: 16.w,
            end: 16.w,
            bottom: 12.h,
          ),
        ),
      ),
    );
  }
}
