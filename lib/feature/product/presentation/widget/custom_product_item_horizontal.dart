import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_task/core/app_color.dart';
import 'package:k_task/feature/product/data/model/product_model.dart';
import 'package:k_task/feature/product/presentation/manager/product_cubit.dart';
import 'package:k_task/feature/product/presentation/manager/product_state.dart';

class CustomProductItemHorizontal extends StatelessWidget {
  const CustomProductItemHorizontal({Key? key}) : super(key: key);

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
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            width: double.infinity,
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1 / 1.8,
              ),
              itemBuilder: (context, index) {
                return BuildItemHorizontal(
                  product: cubit.productModel!.products![index],
                );
              },
              itemCount: cubit.productModel!.products!.length,
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

class BuildItemHorizontal extends StatelessWidget {
  BuildItemHorizontal({Key? key, required this.product}) : super(key: key);

  Products product;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height * .28,
                width: MediaQuery.of(context).size.width * .8,
                imageUrl: product.images![0],
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Container(
                  height: MediaQuery.of(context).size.height * .28,
                  width: MediaQuery.of(context).size.width * .8,
                  color: AppColor.grayColor,
                  child: const Icon(Icons.error),
                ),
              ),
            ),
            const Spacer(),
            Text(
              product.name!,
              style: Theme.of(context).textTheme.titleLarge,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              width: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
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
                      'دولار',
                      style:
                          TextStyle(color: AppColor.appBarColor, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
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
          ],
        ),
      ),
    );
  }
}
