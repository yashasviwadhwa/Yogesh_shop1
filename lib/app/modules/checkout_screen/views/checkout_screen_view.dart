import 'package:e_shop/app/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/checkout_screen_controller.dart';

class CheckoutScreenView extends GetView<CheckoutScreenController> {
  const CheckoutScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckoutScreen'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Customer Information",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                VerticalGap(
                  gap: 15.h,
                ),
                _buildTextField(controller.email, context, "Email"),
                VerticalGap(
                  gap: 10.h,
                ),
                _buildTextField(controller.name, context, "Name"),
                VerticalGap(
                  gap: 15.h,
                ),
                Text(
                  "Delivery Information",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                VerticalGap(
                  gap: 15.h,
                ),
                _buildTextField(controller.name, context, "Address"),
                VerticalGap(
                  gap: 15.h,
                ),
                _buildTextField(controller.name, context, "City"),
                VerticalGap(
                  gap: 15.h,
                ),
                _buildTextField(controller.name, context, "ZipCode"),
                VerticalGap(
                  gap: 15.h,
                ),
                _buildTextField(controller.name, context, "Country"),
                VerticalGap(
                  gap: 15.h,
                ),
                Text(
                  "ORDER SUMMARY",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildTextField(TextEditingController controller,
      BuildContext context, String labelText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 75.w,
            child: Text(
              labelText,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 10),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
