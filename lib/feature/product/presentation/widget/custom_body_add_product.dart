import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_task/core/app_string.dart';
import 'package:k_task/feature/product/presentation/manager/product_cubit.dart';
import 'package:k_task/feature/product/presentation/manager/product_state.dart';
import 'package:k_task/feature/product/presentation/widget/custom_button.dart';
import 'package:k_task/feature/product/presentation/widget/custom_dropdown_button.dart';
import 'package:k_task/feature/product/presentation/widget/custom_product_image_container.dart';
import 'package:k_task/feature/product/presentation/widget/custom_text_form_field.dart';

class CustomBodyAddProduct extends StatelessWidget {
  CustomBodyAddProduct({Key? key}) : super(key: key);

  TextEditingController productName = TextEditingController();
  TextEditingController storeName = TextEditingController();
  TextEditingController price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 13, left: 19),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 23),
                  child: Text(
                    AppString.picProducts,
                    style: Theme.of(context).textTheme.displayMedium,
                    textAlign: TextAlign.right,
                  ),
                ),
                const CustomProductImageContainer(),
                CustomButton(
                    onPressed: () {
                      BlocProvider.of<ProductCubit>(context)
                          .selectedProductImages();
                    },
                    widget: Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/vector_add.png'),
                        const SizedBox(
                          width: 14,
                        ),
                        Text(AppString.pressToAddPic),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  AppString.productName,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                CustomTextFormField(
                  hintText: AppString.productName,
                  controller: productName,
                  validator: (p0) {},
                ),
                Text(
                  AppString.storeName,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                CustomTextFormField(
                  hintText: AppString.storeName,
                  controller: storeName,
                  validator: (p0) {},
                ),
                Text(
                  AppString.price,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                CustomTextFormField(
                  hintText: AppString.price,
                  controller: price,
                  validator: (p0) {},
                ),
                Text(
                  AppString.classification,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                CustomDropDownButton(),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onPressed: () {},
                  widget: Text(AppString.addProduct),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
