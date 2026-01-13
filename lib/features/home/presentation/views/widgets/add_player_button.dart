import 'package:flutter/material.dart';
import 'package:t2sema/core/widgets/glass_button.dart';

class AddPlayerButton extends StatelessWidget {
  const AddPlayerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassButton(
      title: 'Add Player',
      iconPath: 'assets/icons/ic_add_player.svg',
      onTap: () {},
      width: 170,
    );
  }
}
