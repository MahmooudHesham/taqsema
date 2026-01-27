import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqsema/core/utils/app_haptics.dart';
import 'package:taqsema/core/widgets/confirm_delete_dialog.dart';
import 'package:taqsema/core/widgets/custom_dismiss_background.dart';
import 'package:taqsema/core/widgets/custom_snack_bar.dart';
import 'package:taqsema/features/players/data/models/player_model.dart';
import 'package:taqsema/features/players/presentation/manager/players_cubit/players_cubit.dart';
import 'package:taqsema/features/players/presentation/views/widgets/player_card.dart';

class PlayersListView extends StatefulWidget {
  const PlayersListView({
    super.key,
    required this.players,
    required this.selectedPlayerIds,
    required this.onPlayerToggle,
  });

  final List<PlayerModel> players;
  final Set<String> selectedPlayerIds;
  final ValueChanged<String> onPlayerToggle;

  @override
  State<PlayersListView> createState() => _PlayersListViewState();
}

class _PlayersListViewState extends State<PlayersListView> {
  final ScrollController _scrollController = ScrollController();

  // Haptic tracking variables
  double _lastHapticOffset = 0;
  int _lastHapticTimeMs = 0;
  double _previousOffset = 0;
  int _previousTimeMs = 0;
  bool _isOverscrolling = false;

  // Configuration constants
  static const int _minIntervalMs = 35;
  static const double _baseThreshold = 50.0;
  static const double _minThreshold = 20.0;
  static const double _maxThreshold = 80.0;

  @override
  void initState() {
    super.initState();
    _previousTimeMs = DateTime.now().millisecondsSinceEpoch;
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    // If the controller isn't attached (e.g. view disposed), do nothing
    if (!_scrollController.hasClients) return;

    final now = DateTime.now().millisecondsSinceEpoch;
    final currentOffset = _scrollController.offset;

    // Calculate actual velocity (pixels per millisecond)
    final timeDelta = now - _previousTimeMs;
    final offsetDelta = (currentOffset - _previousOffset).abs();

    double velocity = 0;
    if (timeDelta > 0) {
      velocity = offsetDelta / timeDelta;
    }

    // Update previous values for next calculation
    _previousOffset = currentOffset;
    _previousTimeMs = now;

    // Check if we should trigger haptic
    final distanceSinceLastHaptic = (currentOffset - _lastHapticOffset).abs();
    final timeSinceLastHaptic = now - _lastHapticTimeMs;

    // Calculate adaptive threshold based on velocity
    final threshold = _calculateAdaptiveThreshold(velocity);

    if (distanceSinceLastHaptic >= threshold &&
        timeSinceLastHaptic >= _minIntervalMs) {
      _triggerScrollHaptic(velocity);
      _lastHapticOffset = currentOffset;
      _lastHapticTimeMs = now;
    }
  }

  double _calculateAdaptiveThreshold(double velocity) {
    // velocity is in pixels/ms
    // ~0.5 px/ms = slow scroll
    // ~1.5 px/ms = medium scroll
    // ~3.0+ px/ms = fast scroll/fling
    if (velocity > 2.5) return _minThreshold;
    if (velocity > 1.5) return _baseThreshold * 0.6;
    if (velocity > 0.8) return _baseThreshold * 0.8;
    if (velocity > 0.3) return _baseThreshold;
    return _maxThreshold;
  }

  void _triggerScrollHaptic(double velocity) {
    // Use consistent haptic type for smoothness
    if (velocity > 4.0) {
      AppHaptics.buttonPress(); // Light Impact
    } else {
      AppHaptics.selection(); // Selection Click
    }
  }

  void _handleScrollNotification(ScrollNotification notification) {
    // Handle overscroll (bounce) haptics
    if (notification is OverscrollNotification) {
      if (!_isOverscrolling) {
        AppHaptics.success(); // Medium Impact
        _isOverscrolling = true;
      }
    } else if (notification is ScrollEndNotification) {
      _isOverscrolling = false;
    }
  }

  void _deletePlayer(BuildContext context, PlayerModel player) {
    context.read<PlayersCubit>().deletePlayer(player);
    showCustomSnackBar(context, message: "${player.name} deleted");
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        _handleScrollNotification(notification);
        return false;
      },
      child: ListView.separated(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 120),
        itemCount: widget.players.length,
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemBuilder: (context, index) {
          final player = widget.players[index];
          final bool isSelected = widget.selectedPlayerIds.contains(player.id);
          return Dismissible(
            key: Key(player.id),
            direction: DismissDirection.endToStart,
            background: const CustomDismissBackground(),
            confirmDismiss: (direction) {
              AppHaptics.heavyWarning();
              return showDeleteConfirmDialog(
                context: context,
                itemName: player.name,
              );
            },
            onDismissed: (direction) => _deletePlayer(context, player),
            child: PlayerCard(
              player: player,
              isSelected: isSelected,
              onTap: () {
                AppHaptics.selection();
                widget.onPlayerToggle(player.id);
              },
            ),
          );
        },
      ),
    );
  }
}
