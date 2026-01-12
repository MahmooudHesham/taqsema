import 'package:flutter/material.dart';
import 'package:t2sema/core/utils/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text("تقسيمة", style: AppStyles.textStyleBold40),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
