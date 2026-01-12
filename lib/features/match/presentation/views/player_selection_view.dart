import 'package:flutter/material.dart';
import 'package:t2sema/core/utils/app_styles.dart';
import 'package:t2sema/features/players/presentation/views/widgets/player_card.dart';

class PlayerSelectionView extends StatefulWidget {
  const PlayerSelectionView({super.key});

  @override
  State<PlayerSelectionView> createState() => _PlayerSelectionViewState();
}

class _PlayerSelectionViewState extends State<PlayerSelectionView> {
  // 1. Temporary Data: List of 10 Dummy Players
  final List<String> playerNames = [
    "Mahmoud Hesham",
    "Ahmed Ali",
    "Mohamed Salah",
    "Omar Tarek",
    "Youssef Nabil",
    "Khaled Hossam",
    "Ibrahim Adel",
    "Hassan Moustafa",
    "Ziad Amr",
    "Karim Benzema",
  ];

  // 2. Selection State: Stores the 'index' of every selected player
  final Set<int> selectedIndices = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("تقسيمة", style: AppStyles.textStyleBold40),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: playerNames.length,
          itemBuilder: (context, index) {
            final bool isSelected = selectedIndices.contains(index);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: PlayerCard(
                name: playerNames[index],
                image: index == 0
                    ? 'assets/images/IMG-20220820-WA0029-01.jpeg'
                    : null,
                isSelected: isSelected,
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      selectedIndices.remove(index); // Deselect
                    } else {
                      selectedIndices.add(index); // Select
                    }
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
