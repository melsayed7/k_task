import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_task/core/app_color.dart';
import 'package:k_task/core/app_string.dart';
import 'package:k_task/feature/product/presentation/manager/product_cubit.dart';
import 'package:k_task/feature/product/presentation/manager/product_state.dart';

class CustomDropDownButton extends StatelessWidget {
  CustomDropDownButton({Key? key}) : super(key: key);

  List<String> list = ['تصنيف 1', 'تصنيف 2', 'تصنيف 3'];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColor.borderBoxColor,
              width: 1,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    BlocProvider.of<ProductCubit>(context)
                                .classificationSelected ==
                            null
                        ? AppString.classificationName
                        : BlocProvider.of<ProductCubit>(context)
                            .classificationSelected!,
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(color: AppColor.blueColor),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Image.asset(
                      'assets/images/arrowcircledown.png',
                    ),
                  ),
                ],
              ),
              iconSize: 0,
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Text(
                        value,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                BlocProvider.of<ProductCubit>(context)
                    .changeClassification(value);
                print(value);
              },
            ),
          ),
        );
      },
    );
  }
}
