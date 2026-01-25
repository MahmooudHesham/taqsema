import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taqsema/core/utils/app_styles.dart';

class ButtonAction extends StatelessWidget {
  const ButtonAction({super.key, required this.title, required this.iconPath});
  final String title, iconPath;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(title, style: AppStyles.textStyleMedium16),
        SvgPicture.asset(iconPath),
      ],
    );
  }
}
