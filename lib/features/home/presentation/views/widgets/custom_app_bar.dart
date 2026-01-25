import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taqsema/core/utils/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.onLeadingPressed});

  final VoidCallback? onLeadingPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      leading: onLeadingPressed != null
          ? IconButton(
              onPressed: onLeadingPressed,
              icon: const Icon(Icons.arrow_back_ios_new),
            )
          : null,
      title: SvgPicture.asset(kAppFullLogoSvg),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
