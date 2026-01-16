import 'package:flutter/material.dart';
import 'package:t2sema/core/widgets/glass_container.dart';

class GlassDialog extends StatelessWidget {
  const GlassDialog({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: RepaintBoundary(
        child: GlassContainer(
          opacity: 180,
          blurStrength: 2,
          width: double.infinity,
          borderRadius: 12,
          child: Padding(
            padding:
                padding ??
                const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: child,
          ),
        ),
      ),
    );
  }
}

Future<T?> showAppDialog<T>({
  required BuildContext context,
  required Widget child,
  EdgeInsetsGeometry? padding,
}) {
  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black.withAlpha(150),
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (context, animation, secondaryAnimation) {
      return GlassDialog(padding: padding, child: child);
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.easeInCubic,
      );
      return ScaleTransition(
        scale: Tween<double>(begin: 0.8, end: 1.0).animate(curvedAnimation),
        child: FadeTransition(opacity: curvedAnimation, child: child),
      );
    },
  );
}
