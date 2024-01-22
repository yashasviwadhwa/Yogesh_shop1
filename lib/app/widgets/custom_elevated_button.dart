import 'package:e_shop/app/widgets/text_design.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_color.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.onTab,
    required this.text,
    this.buttonBackGround,
    this.borderColor,
    this.textColor,
    this.textStyle,
    this.padding,
    this.fontWeight,
    this.fontSize,
    this.borderRadius,
    super.key,
  });

  final String text;
  final EdgeInsetsGeometry? padding;
  final void Function() onTab;
  final TextStyle? textStyle;
  final Color? buttonBackGround;
  final Color? borderColor;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      autofocus: true,
      onPressed: onTab,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius?.r ?? 30.0.r,
          ),
        ),
        side: BorderSide(
          color: borderColor ?? AppColor.color262c44,
        ),
        backgroundColor: buttonBackGround ?? AppColor.color262c44,
        padding:
            padding ?? EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
      ),
      child: TextDesign(
        text: text,
        maxLines: 1,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontSize: fontSize ?? 18.sp,
        color: textColor,
      ),
    );
  }
}
