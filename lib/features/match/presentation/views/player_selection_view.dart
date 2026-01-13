import 'package:flutter/material.dart';
import 'package:t2sema/core/utils/app_styles.dart';
import 'package:t2sema/features/players/presentation/views/widgets/player_card.dart';

class PlayerSelectionView extends StatefulWidget {
  const PlayerSelectionView({super.key});

  @override
  State<PlayerSelectionView> createState() => _PlayerSelectionViewState();
}

class _PlayerSelectionViewState extends State<PlayerSelectionView> {
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

  final Set<int> selectedIndices = {};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text(
            'Player Selected #${selectedIndices.length}',
            style: AppStyles.textStyleSemiBold16,
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 120),
              itemCount: playerNames.length,
              itemBuilder: (context, index) {
                final bool isSelected = selectedIndices.contains(index);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      PlayerCard(
                        name: playerNames[index],
                        image: index == 0
                            ? 'assets/images/IMG-20220820-WA0029-01.jpeg'
                            : null,
                        isSelected: isSelected,
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedIndices.remove(index);
                            } else {
                              selectedIndices.add(index);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
