import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class VerticalGap extends StatelessWidget {
  double? gap;

  VerticalGap({super.key, this.gap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: gap?.h ?? 10.h,
    );
  }
}

// ignore: must_be_immutable
class HorizontalGap extends StatelessWidget {
  double? gap;

  HorizontalGap({super.key, this.gap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: gap?.w ?? 10.w,
    );
  }
}
