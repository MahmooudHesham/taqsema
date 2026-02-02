import 'package:flutter/material.dart';
import 'package:taqsema/core/utils/app_colors.dart';
import 'package:taqsema/core/utils/app_constants.dart';
import 'package:taqsema/core/utils/app_styles.dart';
import 'package:taqsema/core/utils/size_config.dart';

const _duration = Duration(seconds: 2);
const _successColor = Color(0xFF029770);

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
      backgroundColor: isError ? AppColors.error : _successColor,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        left: 40.w,
        right: 40.w,
        bottom: AppConstants.snackBarBottomMargin(context),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      duration: _duration,
      dismissDirection: DismissDirection.horizontal,
    ),
  );
}
