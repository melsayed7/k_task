import 'package:flutter/material.dart';
import 'package:k_task/core/app_color.dart';
import 'package:k_task/core/app_string.dart';

class ClassificationList extends StatelessWidget {
  ClassificationList({Key? key}) : super(key: key);

  List<String> imagePath = [
    AppString.classifImage0,
    AppString.classifImage1,
    AppString.classifImage2,
    AppString.classifImage3,
  ];
  List<String> imageTitle = [
    AppString.showAll,
    AppString.classification1,
    AppString.classification2,
    AppString.classification3,
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.separated(
          itemCount: imageTitle.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return CustomContainerClassification(
                image: imagePath[index], text: imageTitle[index]);
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
        ),
      ),
    );
  }
}

class CustomContainerClassification extends StatelessWidget {
  CustomContainerClassification({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);
  String image;

  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .25,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Image.asset(image),
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
