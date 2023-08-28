import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_task/core/app_color.dart';
import 'package:k_task/core/app_string.dart';
import 'package:k_task/feature/product/presentation/manager/product_cubit.dart';
import 'package:k_task/feature/product/presentation/manager/product_state.dart';
import 'package:k_task/feature/product/presentation/widget/classification_list.dart';
import 'package:k_task/feature/product/presentation/widget/custom_product_item_horizontal.dart';
import 'package:k_task/feature/product/presentation/widget/custom_product_item_vertical.dart';

class CustomBodyProduct extends StatelessWidget {
  const CustomBodyProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(right: 16, left: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                AppString.classifications,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.right,
              ),
              ClassificationList(),
              const SizedBox(
                height: 6,
              ),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<ProductCubit>(context).changeHomeView();
                },
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/vector_red.png'),
                          const SizedBox(
                            width: 9,
                          ),
                          BlocBuilder<ProductCubit, ProductState>(
                            builder: (context, state) {
                              return Text(
                                AppString.changeProducts +
                                    (BlocProvider.of<ProductCubit>(context)
                                            .isViewHorizontal
                                        ? "رأسي"
                                        : "افقي"),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: AppColor.redColor),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              BlocProvider.of<ProductCubit>(context).isViewHorizontal
                  ? const CustomProductItemHorizontal()
                  : const CustomProductItemVertical(),
            ],
          ),
        );
      },
    );
  }
}
