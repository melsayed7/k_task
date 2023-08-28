import 'package:flutter/material.dart';
import 'package:k_task/core/app_color.dart';
import 'package:k_task/core/app_string.dart';
import 'package:k_task/feature/product/presentation/widget/custom_body_add_product.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);
  static const String routeName = 'addProductScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.addProducts,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColor.blackColor,
                fontWeight: FontWeight.w700,
              ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10, top: 7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: .5, color: AppColor.grayColor),
                color: AppColor.whiteColor),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 20,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
      body: CustomBodyAddProduct(),
    );
  }
}
