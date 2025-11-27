import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import 'bottom_tab_bar_view_model.dart';
import '../../shared/shimmer.dart';

class BottomTabBar extends StatelessWidget {
  final BottomTabBarViewModel viewModel;
  final int currentIndex;

  const BottomTabBar._(
      {super.key, required this.viewModel, required this.currentIndex});

  static Widget instantiate(
      {Key? key,
      required BottomTabBarViewModel viewModel,
      required int currentIndex}) {
    return BottomTabBar._(
        key: key, viewModel: viewModel, currentIndex: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    if (viewModel.isLoading) {
      return Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(viewModel.bottomTabs.length, (index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                ShimmerContainer(width: 24, height: 24, borderRadius: BorderRadius.all(Radius.circular(12))),
                SizedBox(height: 6),
                ShimmerContainer(width: 36, height: 8, borderRadius: BorderRadius.all(Radius.circular(4))),
              ],
            );
          }),
        ),
      );
    }

    return BottomNavigationBar(
      items: viewModel.bottomTabs,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: normalSecondaryBrandColor,
      unselectedItemColor: ThemeColors.secondaryText(context),
      showUnselectedLabels: true,
      currentIndex: currentIndex,
      onTap: viewModel.onIndexChanged,
    );
  }
}
