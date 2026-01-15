import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:t2sema/core/widgets/custom_button.dart';
import 'package:t2sema/core/widgets/custom_text_form_field.dart';
import 'package:t2sema/core/widgets/glass_container.dart';
import 'package:t2sema/features/players/presentation/views/widgets/player_image_picker.dart';

class AddPlayerDialog extends StatefulWidget {
  const AddPlayerDialog({super.key});

  @override
  State<AddPlayerDialog> createState() => _AddPlayerDialogState();
}

class _AddPlayerDialogState extends State<AddPlayerDialog> {
  final GlobalKey<FormState> formKey = GlobalKey();
  late final TextEditingController nameController;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

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
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextFormField(
                    hintText: 'Player Name',
                    controller: nameController,
                    validator: _validateName,
                  ),
                  const SizedBox(height: 30),
                  PlayerImagePicker(
                    onTap: () {
                      // TODO: Implement image selection
                    },
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: CustomButton(
                      label: 'Add',
                      onTap: () {
                        _onAddPlayer(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onAddPlayer(BuildContext context) {
    if (formKey.currentState!.validate()) {
      log("Player Name: ${nameController.text}");
      Navigator.pop(context);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Name is required";
    }
    return null;
  }
}

void showAddPlayerDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black.withAlpha(150),
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (context, animation, secondaryAnimation) {
      return const AddPlayerDialog();
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
