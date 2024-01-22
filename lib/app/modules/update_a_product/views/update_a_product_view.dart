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
import '../controllers/update_a_product_controller.dart';

class UpdateAProductView extends GetView<UpdateAProductController> {
  const UpdateAProductView({Key? key}) : super(key: key);

  Widget _ui() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      children: [
        Label(
          text: AppString.productName,
          isMandatory: true,
        ),
        TextField(
          style: GoogleFonts.lato(
            color: AppColor.colorText,
          ),
          controller: controller.pNameController,
          cursorColor: AppColor.color262c44,
          inputFormatters: [
            FilteringTextInputFormatter.allow(
                RegExp(r'[a-z A-Z0-9!@#\$%^&*(),.?":{}|<>]')),
          ],
          keyboardType: TextInputType.text,
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
          gap: 20,
        ),
        Label(
          text: AppString.description,
          isMandatory: true,
        ),
        TextField(
          style: GoogleFonts.lato(
            color: AppColor.colorText,
          ),
          controller: controller.descriptionController,
          cursorColor: AppColor.color262c44,
          keyboardType: TextInputType.text,
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
          gap: 20,
        ),
        Label(
          text: AppString.price,
          isMandatory: true,
        ),
        TextField(
          style: GoogleFonts.lato(
            color: AppColor.colorText,
          ),
          controller: controller.priceController,
          cursorColor: AppColor.color262c44,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
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
          gap: 20,
        ),
        Label(
          text: AppString.percentageDiscount,
          isMandatory: true,
        ),
        TextField(
          style: GoogleFonts.lato(
            color: AppColor.colorText,
          ),
          controller: controller.discountController,
          cursorColor: AppColor.color262c44,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
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
          gap: 20,
        ),
        Label(
          text: AppString.brand,
          isMandatory: true,
        ),
        TextField(
          style: GoogleFonts.lato(
            color: AppColor.colorText,
          ),
          controller: controller.brandController,
          cursorColor: AppColor.color262c44,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[a-z A-Z]')),
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
          gap: 20,
        ),
        Label(
          text: AppString.category,
          isMandatory: true,
        ),
        TextField(
          style: GoogleFonts.lato(
            color: AppColor.colorText,
          ),
          controller: controller.categoryController,
          cursorColor: AppColor.color262c44,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[a-z A-Z]')),
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
          gap: 20,
        ),
        Label(
          text: AppString.ratings,
          isMandatory: true,
        ),
        TextField(
          style: GoogleFonts.lato(
            color: AppColor.colorText,
          ),
          controller: controller.ratingController,
          cursorColor: AppColor.color262c44,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
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
          gap: 20,
        ),
        Label(
          text: AppString.stock,
          isMandatory: true,
        ),
        TextField(
          style: GoogleFonts.lato(
            color: AppColor.colorText,
          ),
          controller: controller.stockController,
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
          text: AppString.updateAProduct,
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
