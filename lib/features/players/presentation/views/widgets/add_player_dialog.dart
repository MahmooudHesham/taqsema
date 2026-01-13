import 'package:flutter/material.dart';
import 'package:t2sema/core/widgets/custom_text_form_field.dart';
import 'package:t2sema/core/widgets/glass_container.dart';
import 'package:t2sema/features/players/presentation/views/widgets/player_image_picker.dart';

class AddPlayerDialog extends StatelessWidget {
  const AddPlayerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: GlassContainer(
        opacity: 204,
        width: double.infinity,
        height: 300,
        borderRadius: 12,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextFormField(
                    hintText: 'Player Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name is required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  PlayerImagePicker(onTap: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
