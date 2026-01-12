import 'package:flutter/material.dart';
import 'package:t2sema/core/utils/app_styles.dart';

class PlayerSelectionView extends StatelessWidget {
  const PlayerSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('تقسيمة', style: AppStyles.textStyleBold40)),
    );
  }
}
