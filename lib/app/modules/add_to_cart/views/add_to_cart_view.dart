import 'package:e_shop/app/widgets/custom_cached_image.dart';
import 'package:e_shop/app/widgets/custom_elevated_button.dart';
import 'package:e_shop/app/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_string.dart';
import '../../../widgets/text_design.dart';
import '../controllers/add_to_cart_controller.dart';

class AddToCartView extends GetView<AddToCartController> {
  const AddToCartView({Key? key}) : super(key: key);

  Widget _ui() {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 15.h,
      ),
      children: [
        Obx(() {
          return controller.isLoading.value
              ? const SizedBox()
              : ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => _cartListDesign(
                    id: controller.cartList.first.products?[index].id
                            .toString() ??
                        '',
                    image:
                        controller.cartList.first.products?[index].thumbnail ??
                            '',
                    title:
                        controller.cartList.first.products?[index].title ?? '',
                    price: controller.cartList.first.products?[index].price
                            .toString() ??
                        '',
                    quantity: controller
                            .cartList.first.products?[index].quantity
                            .toString() ??
                        '',
                    totalPrice: controller.cartList.first.products?[index].total
                            .toString() ??
                        '',
                    discountPrice: controller
                            .cartList.first.products?[index].discountedPrice
                            .toString() ??
                        '',
                    discountPercentage: controller
                            .cartList.first.products?[index].discountPercentage
                            .toString() ??
                        '',
                  ),
                  separatorBuilder: (context, index) => VerticalGap(
                    gap: 15,
                  ),
                  itemCount: controller.cartList.first.products?.length ?? 0,
                );
        }),
        VerticalGap(
          gap: 40,
        ),
        Obx(() {
          return controller.isLoading.value
              ? const SizedBox()
              : _showBill(
                  total: controller.cartList.first.total ?? 0,
                  totalProducts:
                      controller.cartList.first.totalProducts.toString(),
                  totalQuantity:
                      controller.cartList.first.totalQuantity.toString(),
                  discountedTotal:
                      controller.cartList.first.discountedTotal ?? 0,
                );
        }),
      ],
    );
  }

  Widget _cartListDesign({
    required String id,
    required String image,
    required String title,
    required String price,
    required String quantity,
    required String totalPrice,
    required String discountPrice,
    required String discountPercentage,
  }) {
    return GestureDetector(
      onTap: () => Get.back(result: id),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 15.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: LinearGradient(colors: [
            AppColor.color0E101B.withOpacity(0.05),
            AppColor.color262c44.withOpacity(0.25),
          ], begin: Alignment.topCenter),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: CustomCachedImage(
                imageUrl: image,
                height: 70,
              ),
            ),
            HorizontalGap(),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextDesign(
                    maxLines: 2,
                    text: title,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  Row(
                    children: [
                      TextDesign(
                        maxLines: 1,
                        text: '₹$price',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      HorizontalGap(),
                      Text(
                        "Quantity: $quantity",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: AppColor.colorText.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextDesign(
                        maxLines: 1,
                        text: '₹$discountPrice',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      HorizontalGap(),
                      Text(
                        '₹$totalPrice',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: AppColor.colorText.withOpacity(0.6),
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      HorizontalGap(),
                      Text(
                        "($discountPercentage%)",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showBillRowDesign({
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: TextDesign(
            text: title,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        HorizontalGap(
          gap: 20,
        ),
        Expanded(
          child: TextDesign(
            text: value,
            textAlign: TextAlign.end,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _showBill({
    required int total,
    required String totalProducts,
    required String totalQuantity,
    required int discountedTotal,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 15.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        gradient: LinearGradient(colors: [
          AppColor.color0E101B.withOpacity(0.05),
          AppColor.color262c44.withOpacity(0.25),
        ], begin: Alignment.topCenter),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _showBillRowDesign(
            title: 'Total Products',
            value: totalProducts,
          ),
          _showBillRowDesign(
            title: 'Total Quantity',
            value: totalQuantity,
          ),
          _showBillRowDesign(
            title: 'Bill Amount',
            value: (total + discountedTotal).toString(),
          ),
          _showBillRowDesign(
            title: 'Discount Amount',
            value: '-$discountedTotal',
          ),
          const Divider(),
          _showBillRowDesign(
            title: 'Total Amount',
            value: total.toString(),
          ),
        ],
      ),
    );
  }

  Widget _buyNow() {
    return Obx(
      () => controller.isLoading.value
          ? const SizedBox()
          : Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 15.h,
              ),
              child: CustomElevatedButton(
                onTab: () {
                  controller.openCheckout();
                },
                text: 'Buy Now',
                buttonBackGround: Colors.amber,
                borderColor: Colors.amber,
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextDesign(
          text: AppString.addAProduct,
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: AppColor.colorWhite,
        ),
        backgroundColor: AppColor.color0E101B,
      ),
      bottomNavigationBar: _buyNow(),
      body: _ui(),
    );
  }
}
