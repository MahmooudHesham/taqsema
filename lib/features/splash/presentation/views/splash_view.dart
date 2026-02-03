import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:taqsema/core/utils/app_colors.dart';
import 'package:taqsema/core/utils/app_router.dart';
import 'package:taqsema/core/utils/app_styles.dart';
import 'package:taqsema/core/utils/constants.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _spacingAnimation;
  late Animation<double> _logoFadeAnimation;

  static const _animationDuration = Duration(milliseconds: 2000);
  static const _splashDuration = Duration(seconds: 3);

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _controller.forward();
    _navigateToHome();
  }

  void _setupAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.8, curve: Curves.easeOut),
      ),
    );

    _logoFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic),
      ),
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.2, 0.8, curve: Curves.easeOutQuart),
          ),
        );

    _spacingAnimation = Tween<double>(begin: 3.0, end: 8.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.decelerate),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(_splashDuration);
    if (!mounted) return;

    final box = Hive.box(kActiveMatchBox);
    if (box.isNotEmpty) {
      context.go(AppRouter.kGeneratedTeamsView);
    } else {
      context.go(AppRouter.kHome);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_buildLogo(), const SizedBox(height: 16), _buildTagLine()],
        ),
      ),
    );
  }

  RepaintBoundary _buildLogo() {
    return RepaintBoundary(
      child: FadeTransition(
        opacity: _logoFadeAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: SvgPicture.asset(kAppFullLogoSvg, width: 300),
        ),
      ),
    );
  }

  RepaintBoundary _buildTagLine() {
    return RepaintBoundary(
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: _buildAnimatedText(),
        ),
      ),
    );
  }

  AnimatedBuilder _buildAnimatedText() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Text(
          "IT'S KICKOFF TIME.",
          style: AppStyles.textStyleBold14.copyWith(
            color: AppColors.primaryText.withAlpha(180),
            letterSpacing: _spacingAnimation.value,
          ),
        );
      },
    );
  }
}
