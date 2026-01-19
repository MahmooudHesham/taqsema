import 'package:flutter/material.dart';
import 'package:t2sema/core/utils/app_colors.dart';
import 'package:t2sema/core/utils/app_styles.dart';

void showCustomSnackBar(
  BuildContext context, {
  required String message,
  bool isError = false,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: AppStyles.textStyleRegular16,
      ),
      backgroundColor: isError
          ? AppColors.error
          : const Color.fromARGB(255, 2, 151, 112),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 80),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(22),
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}
