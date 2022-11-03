import 'package:egystore/screens/SharedComponents/Loaders/main_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NetImage extends StatelessWidget {
  final String uri;


  const NetImage({
    Key? key,
    required this.uri,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      uri,
      // headers: {'Authorization': "Bearer ${Helper.token}"},
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return MainLoader();
      },
      errorBuilder: (
        BuildContext context,
        Object exception,
        StackTrace? stackTrace,
      ) {
        return Image.asset(
          'assets/background.png',
          fit: BoxFit.fill,
        );
      },
    );
  }
}
