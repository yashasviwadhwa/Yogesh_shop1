import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_color.dart';

// ignore: must_be_immutable
class TextDesign extends StatelessWidget {
  String? text;
  double? fontSize;
  int? maxLines;
  Color? color;
  FontWeight? fontWeight;
  TextAlign? textAlign;

  TextDesign(
      {Key? key,
        required this.text,
        this.fontSize,
        this.fontWeight,
        this.maxLines,
        this.color,
        this.textAlign,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines ?? 100,
      style: GoogleFonts.poppins(
        color: color ?? AppColor.colorText,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontSize: fontSize?.sp ?? 16.sp,
      ),
    );
  }
}
