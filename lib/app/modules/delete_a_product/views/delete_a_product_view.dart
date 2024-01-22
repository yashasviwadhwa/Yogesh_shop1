import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_string.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/gap.dart';
import '../../../widgets/label.dart';
import '../../../widgets/text_design.dart';
import '../controllers/delete_a_product_controller.dart';

class DeleteAProductView extends GetView<DeleteAProductController> {
  const DeleteAProductView({Key? key}) : super(key: key);

  Widget _ui() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      children: [
        Label(
          text: AppString.productID,
          isMandatory: true,
        ),
        TextField(
          style: GoogleFonts.lato(
            color: AppColor.colorText,
          ),
          controller: controller.productIDController,
          cursorColor: AppColor.color262c44,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: const BorderSide(
                color: AppColor.color262c44,
              ),
            ),
            hintText: AppString.enter,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: const BorderSide(
                color: AppColor.color262c44,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
            ),
          ),
        ),
        VerticalGap(
          gap: 40,
        ),
        CustomElevatedButton(
          onTab: () => controller.onSubmit(),
          text: AppString.submit,
          textColor: AppColor.colorWhite,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextDesign(
          text: AppString.deleteAProduct,
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: AppColor.colorWhite,
        ),
        backgroundColor: AppColor.color0E101B,
      ),
      body: _ui(),
    );
  }
}
