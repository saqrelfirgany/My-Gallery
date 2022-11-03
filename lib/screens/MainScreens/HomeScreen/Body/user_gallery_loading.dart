import 'package:egystore/helper/decoration_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:shimmer/shimmer.dart';

class UserGalleryLoading extends StatelessWidget {
  const UserGalleryLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        children: List.generate(
          12,
          (index) => Container(
            width: 40.w,
            height: 30.h,
            margin: EdgeInsets.all(8),
            decoration: decorationRadius(radius: 20),
          ),
        ),
      ),
      baseColor: Colors.grey.shade700,
      highlightColor: Colors.grey.shade300,
    );
  }
}
