import 'package:flutter/material.dart';
import 'package:k_task/core/app_color.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.onPressed, required this.widget})
      : super(key: key);

  Widget widget;

  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.greenColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          padding: const EdgeInsets.symmetric(vertical: 20)),
      child: widget,
    );
  }
}
