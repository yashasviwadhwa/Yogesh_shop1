import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_string.dart';
import '../../../widgets/custom_cached_image.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/gap.dart';
import '../../../widgets/text_design.dart';
import '../controllers/product_detail_controller.dart';

// ignore: must_be_immutable
class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({
    Key? key,
  }) : super(key: key);

  Widget _ui() {
    return Obx(() {
      return controller.isLoading.value
          ? const SizedBox()
          : ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 15.h,
              ),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: CustomCachedImage(
                    imageUrl: controller.product.value.thumbnail ?? '',
                    width: double.infinity,
                    height: 250,
                  ),
                ),
                VerticalGap(
                  gap: 20,
                ),
                TextDesign(
                  text: controller.product.value.title ?? '',
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
                VerticalGap(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        TextDesign(
                          text: "\$${controller.product.value.price}",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        HorizontalGap(),
                        TextDesign(
                          text:
                              '${controller.product.value.discountPercentage}%',
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextDesign(
                          text: "Stock(${controller.product.value.stock})",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        HorizontalGap(),
                        TextDesign(
                          text: '⭐${controller.product.value.rating}',
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ],
                ),
                VerticalGap(
                  gap: 20,
                ),
                TextDesign(
                  text: controller.product.value.description ?? '',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ],
            );
    });
  }

  Widget _addToCartAndBuyNow() {
    return Row(
      children: [
        SizedBox(
          width: Get.width * 0.5,
          height: 55.h,
          child: Obx(() {
            return CustomElevatedButton(
              onTab: () => controller.addToCart(),
              borderRadius: 0,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              text: controller.isAddToCart.value
                  ? AppString.addToCart
                  : AppString.removeToCart,
              textColor: AppColor.color0E101B,
              buttonBackGround: AppColor.colorWhite,
              borderColor: AppColor.colorWhite,
            );
          }),
        ),
        SizedBox(
          width: Get.width * 0.5,
          height: 55.h,
          child: CustomElevatedButton(
            onTab: () => controller.openCheckout(),
            borderRadius: 0,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            text: AppString.buyNow,
            textColor: AppColor.colorWhite,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.color0E101B,
        title: Obx(() {
          return TextDesign(
            text: controller.name.value.toString(),
            fontSize: 20,
            maxLines: 1,
            fontWeight: FontWeight.w700,
            color: AppColor.colorWhite,
          );
        }),
      ),
      bottomNavigationBar: _addToCartAndBuyNow(),
      body: _ui(),
    );
  }
}
