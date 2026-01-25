import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taqsema/core/utils/app_colors.dart';
import 'package:taqsema/core/utils/app_styles.dart';
import 'package:taqsema/core/widgets/custom_button.dart';
import 'package:taqsema/core/widgets/custom_snack_bar.dart';
import 'package:taqsema/core/widgets/custom_text_form_field.dart';
import 'package:taqsema/features/players/data/models/player_model.dart';
import 'package:taqsema/features/players/presentation/manager/players_cubit/players_cubit.dart';
import 'package:taqsema/features/players/presentation/views/widgets/player_image_picker.dart';

class PlayerActionDialog extends StatefulWidget {
  final PlayerModel? player;
  const PlayerActionDialog({super.key, this.player});
  @override
  State<PlayerActionDialog> createState() => _PlayerActionDialogState();
}

class _PlayerActionDialogState extends State<PlayerActionDialog> {
  final GlobalKey<FormState> formKey = GlobalKey();
  late final TextEditingController nameController;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  File? selectedImage;
  String? imagePath;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.player?.name);
    imagePath = widget.player?.imagePath;
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.player != null;

    File? imageToShow =
        selectedImage ?? (imagePath != null ? File(imagePath!) : null);
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isEditing ? 'Edit Player' : "Add Player",
              style: AppStyles.textStyleMedium24,
            ),
            const SizedBox(height: 25),
            CustomTextFormField(
              hintText: 'Player Name',
              controller: nameController,
              validator: _validateName,
            ),
            const SizedBox(height: 30),
            PlayerImagePicker(image: imageToShow, onTap: _pickImage),
            const SizedBox(height: 30),
            Center(
              child: CustomButton(
                label: isEditing ? "Confirm" : 'Add',
                onTap: () {
                  _onSave(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSave(BuildContext context) {
    final isEditing = widget.player != null;
    if (formKey.currentState!.validate()) {
      if (!isEditing) {
        context.read<PlayersCubit>().addPlayer(
          name: nameController.text,
          imagePath: selectedImage?.path,
        );
      } else {
        context.read<PlayersCubit>().editPlayer(
          widget.player!,
          nameController.text,
          selectedImage?.path,
        );
      }
      Navigator.pop(context);
      showCustomSnackBar(
        context,
        message: isEditing
            ? "${nameController.text} updated successfully"
            : "${nameController.text} joined the squad!",
      );
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

  Future<void> _pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedFile.path,
          compressQuality: 70,
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Crop Avatar',
              toolbarColor: AppColors.primary,
              toolbarWidgetColor: Colors.white,
              cropStyle: CropStyle.circle,
              initAspectRatio: CropAspectRatioPreset.square,
              lockAspectRatio: true,
            ),
            IOSUiSettings(title: 'Crop Avatar', cropStyle: CropStyle.circle),
          ],
        );
        if (croppedFile != null) {
          setState(() {
            selectedImage = File(croppedFile.path);
          });
        }
      }
    } catch (e) {
      if (mounted) {
        showCustomSnackBar(context, message: 'Failed to pick image: $e');
      }
    }
  }
}
