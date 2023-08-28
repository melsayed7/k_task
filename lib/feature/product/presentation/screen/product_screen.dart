import 'package:flutter/material.dart';
import 'package:k_task/core/app_color.dart';
import 'package:k_task/core/app_string.dart';
import 'package:k_task/feature/product/presentation/screen/add_product_screen.dart';
import 'package:k_task/feature/product/presentation/widget/custom_body_product.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);
  static const String routeName = 'productScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 10, top: 7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: .5, color: AppColor.grayColor),
              color: AppColor.whiteColor),
          child: IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(AddProductScreen.routeName);
            },
          ),
        ),
        title: Text(
          AppString.products,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: CustomBodyProduct(
          /*productModel: BlocProvider.of<ProductCubit>(context).products!*/),
    );
  }
}
