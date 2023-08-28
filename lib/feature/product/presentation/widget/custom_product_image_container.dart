import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_task/core/app_color.dart';
import 'package:k_task/feature/product/presentation/manager/product_cubit.dart';
import 'package:k_task/feature/product/presentation/manager/product_state.dart';

class CustomProductImageContainer extends StatelessWidget {
  const CustomProductImageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .12,
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Container(
                      height: MediaQuery.of(context).size.height * .1,
                      width: MediaQuery.of(context).size.width * .21,
                      color: AppColor.whiteColor,
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemCount: 4,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SelectProductImage(
                        imagePath: BlocProvider.of<ProductCubit>(context)
                            .productImages[index]
                            .path,
                        index: index,
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemCount: BlocProvider.of<ProductCubit>(context)
                        .productImages
                        .length,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SelectProductImage extends StatelessWidget {
  SelectProductImage({
    Key? key,
    required this.imagePath,
    required this.index,
  }) : super(key: key);

  String imagePath;
  int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.file(
          File(imagePath),
          height: MediaQuery.of(context).size.height * .1,
          width: MediaQuery.of(context).size.height * .1,
          fit: BoxFit.fill,
        ),
        Positioned(
          top: 6,
          left: 5,
          child: GestureDetector(
            child: Image.asset(
              'assets/images/x.png',
              height: 25,
              width: 25,
              fit: BoxFit.fill,
            ),
            onTap: () {
              BlocProvider.of<ProductCubit>(context).removeSelectImage(index);
            },
          ),
        )
      ],
    );
  }
}
