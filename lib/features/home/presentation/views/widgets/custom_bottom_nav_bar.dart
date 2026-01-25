import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taqsema/core/utils/app_colors.dart';
import 'package:taqsema/core/utils/app_haptics.dart';
import 'package:taqsema/core/widgets/glass_container.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final ValueChanged<int> onTap;
  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      width: 200,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(0, 'assets/icons/ic_football_field.svg'),
          _buildNavItem(1, 'assets/icons/ic_scoreboard.svg'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String assetPath) {
    final bool isSelected = currentIndex == index;
    return IconButton(
      onPressed: () {
        AppHaptics.selection();
        onTap(index);
      },
      icon: SvgPicture.asset(
        assetPath,
        colorFilter: ColorFilter.mode(
          isSelected ? AppColors.selected : AppColors.primaryText,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
