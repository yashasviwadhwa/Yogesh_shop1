import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_image.dart';

// ignore: must_be_immutable
class CustomCachedImage extends StatelessWidget {
  String imageUrl;
  double? width;
  double? height;
  BoxFit? boxFit;

  CustomCachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.boxFit,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width?.w ?? 100.w,
      height: height?.h ?? 100.h,
      fit: boxFit ?? BoxFit.fill,
      placeholder: (context, _) => Image.asset(
        AppImage.imageNotFound,
        width: width?.w ?? 100.w,
        height: height?.h ?? 100.h,
        fit: boxFit ?? BoxFit.fill,
      ),
      errorWidget: (context, _, __) => Image.asset(
        AppImage.imageNotFound,
        width: width?.w ?? 100.w,
        height: height?.h ?? 100.h,
        fit: boxFit ?? BoxFit.fill,
      ),
    );
  }
}
