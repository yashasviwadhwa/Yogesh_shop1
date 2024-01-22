import 'package:e_shop/app/utils/app_color.dart';
import 'package:e_shop/app/widgets/gap.dart';
import 'package:e_shop/app/widgets/text_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Label extends StatelessWidget {
  String text;
  bool isMandatory;

  Label({
    super.key,
    required this.text,
    this.isMandatory = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: text,
                style: GoogleFonts.lato(
                  color: AppColor.colorText,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600
                ),
              ),
              isMandatory ? TextSpan(
                text: '*',
                style: GoogleFonts.lato(
                  color: Colors.red,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600
                ),
              ) : const TextSpan(),
            ],
          ),
        ),
        VerticalGap(),
      ],
    );
  }
}
