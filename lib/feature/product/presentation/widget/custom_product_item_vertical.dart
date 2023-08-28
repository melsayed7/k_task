import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_task/core/app_color.dart';
import 'package:k_task/feature/product/data/model/product_model.dart';
import 'package:k_task/feature/product/presentation/manager/product_cubit.dart';
import 'package:k_task/feature/product/presentation/manager/product_state.dart';

class CustomProductItemVertical extends StatelessWidget {
  const CustomProductItemVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<ProductCubit>(context);
        if (BlocProvider.of<ProductCubit>(context).productModel?.status ==
                200 ||
            BlocProvider.of<ProductCubit>(context).productModel?.status !=
                null) {
          return Expanded(
            flex: 5,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemCount: cubit.productModel!.products!.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 12,
              ),
              itemBuilder: (context, index) {
                return BuildItemVertical(
                  product: cubit.productModel!.products![index],
                );
              },
            ),
          );
        } else {
          return const Expanded(
            flex: 5,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

class BuildItemVertical extends StatelessWidget {
  BuildItemVertical({Key? key, required this.product}) : super(key: key);

  Products product;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.whiteColor,
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height * .18,
              width: MediaQuery.of(context).size.width * .35,
              imageUrl: product.images![0],
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Container(
                height: MediaQuery.of(context).size.height * .18,
                width: MediaQuery.of(context).size.width * .35,
                color: AppColor.grayColor,
                child: const Icon(Icons.error),
              ),
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          Expanded(
            child: Column(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name!,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      '${product.price!}',
                      style: TextStyle(
                        color: AppColor.greenColor,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'دولار ',
                      style:
                          TextStyle(color: AppColor.appBarColor, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.boxColor,
                  ),
                  child: Text(
                    product.sellerName!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
