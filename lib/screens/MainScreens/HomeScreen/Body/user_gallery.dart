import 'package:egystore/helper/decoration_helper.dart';
import 'package:egystore/models/user_gallery.dart';
import 'package:egystore/screens/SharedComponents/Image/net_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class UserGallery extends StatelessWidget {
  const UserGallery({
    Key? key,
    required this.userGalleryModel,
  }) : super(key: key);
  final UserGalleryModel userGalleryModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        children: List.generate(
          userGalleryModel.images.length,
              (index) => Container(
            width: 40.w,
            height: 30.h,
            margin: EdgeInsets.all(8),
            decoration: decorationRadius(radius: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: NetImage(
                uri: '${userGalleryModel.images[index]}',
              ),
            ),
          ),
        ),
      ),
    );
  }
}