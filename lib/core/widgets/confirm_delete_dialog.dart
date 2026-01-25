import 'package:flutter/material.dart';
import 'package:taqsema/core/utils/app_colors.dart';
import 'package:taqsema/core/utils/app_styles.dart';

Future<bool?> showDeleteConfirmDialog({
  required BuildContext context,
  required String itemName,
}) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirm', style: AppStyles.textStyleMedium24),
        content: Text(
          'Are you sure you want to delete $itemName ?',
          style: AppStyles.textStyleRegular16,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(
              "Delete",
              style: AppStyles.textStyleMedium14.copyWith(
                color: AppColors.error,
              ),
            ),
          ),
        ],
      );
    },
  );
}
