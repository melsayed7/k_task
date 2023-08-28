import 'package:flutter/material.dart';
import 'package:k_task/core/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.validator,
  }) : super(key: key);
  String hintText;

  TextEditingController controller;

  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 21),
      child: TextFormField(
        textDirection: TextDirection.rtl,
        validator: validator,
        controller: controller,
        style: TextStyle(color: AppColor.blackColor, fontSize: 20),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintTextDirection: TextDirection.rtl,
          fillColor: AppColor.whiteColor,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColor.textProductColor,
            fontSize: 14,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColor.borderBoxColor,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1,
              color: AppColor.borderBoxColor,
            ),
          ),
        ),
      ),
    );
  }
}
