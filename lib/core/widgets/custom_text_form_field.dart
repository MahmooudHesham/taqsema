import 'package:flutter/material.dart';
import 'package:t2sema/core/utils/app_colors.dart';
import 'package:t2sema/core/utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
  });

  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: AppStyles.textStyleMedium16,
      cursorColor: AppColors.selected,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        filled: true,
        fillColor: AppColors.primaryText.withAlpha(50),
        hintText: hintText,
        hintStyle: AppStyles.textStyleRegular16,
        enabledBorder: _buildBorder(color: AppColors.selected),
        focusedBorder: _buildBorder(color: AppColors.selected, width: 3),
        errorBorder: _buildBorder(color: AppColors.error, width: 2),
        focusedErrorBorder: _buildBorder(color: AppColors.error, width: 3),
        border: _buildBorder(),
      ),
    );
  }

  OutlineInputBorder _buildBorder({
    double radius = 12,
    Color color = Colors.grey,
    double width = 1,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
