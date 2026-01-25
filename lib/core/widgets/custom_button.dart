import 'package:flutter/material.dart';
import 'package:taqsema/core/utils/app_colors.dart';
import 'package:taqsema/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    this.onTap,
    this.isLoading = false,
    this.color = AppColors.primary,
    this.textColor = AppColors.primaryText,
    this.textStyle,
    this.width,
    this.height = 50,
    this.borderRadius,
  });

  final String label;
  final VoidCallback? onTap;
  final bool isLoading;
  final Color? color;
  final Color textColor;
  final TextStyle? textStyle;
  final double? width;
  final double height;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onTap != null;

    final backgroundColor = isEnabled ? color : Colors.grey;
    final effectiveTextColor = isEnabled ? textColor : Colors.white;

    final baseStyle = textStyle ?? AppStyles.textStyleSemiBold20;

    return Material(
      color: backgroundColor,
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: isLoading ? null : onTap,
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: isLoading
              ? _buildLoader(effectiveTextColor)
              : _buildLabel(baseStyle, effectiveTextColor),
        ),
      ),
    );
  }

  SizedBox _buildLoader(Color color) {
    return SizedBox(
      width: 24,
      height: 24,
      child: CircularProgressIndicator(color: color, strokeWidth: 3),
    );
  }

  FittedBox _buildLabel(TextStyle baseStyle, Color color) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(label, style: baseStyle.copyWith(color: color)),
    );
  }
}
