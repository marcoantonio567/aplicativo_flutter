import 'package:flutter/material.dart';
import 'tab_view_model.dart';
import '../../shared/colors.dart';
import '../../shared/shimmer.dart';

class TabComponent extends StatefulWidget {
  final TabViewModel tabViewModel;

  const TabComponent._({super.key, required this.tabViewModel});

  @override
  State<TabComponent> createState() => _TabComponentState();

  static Widget instantiate({Key? key, required TabViewModel tabViewModel}) {
    return TabComponent._(key: key, tabViewModel: tabViewModel);
  }
}

class _TabComponentState extends State<TabComponent>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: widget.tabViewModel.tabs.length,
        vsync: this,
        initialIndex: widget.tabViewModel.initialIndex);
    tabController.addListener(handleTabChange);
  }

  void handleTabChange() {
    if (tabController.indexIsChanging) {
      widget.tabViewModel.onIndexChanged?.call(tabController.index);
    }
  }

  @override
  void dispose() {
    tabController.removeListener(handleTabChange);
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tabViewModel.isLoading) {
      return Row(
        children: List.generate(widget.tabViewModel.tabs.length, (index) {
          return const Padding(
            padding: EdgeInsets.only(right: 8),
            child: ShimmerContainer(width: 64, height: 36, borderRadius: BorderRadius.all(Radius.circular(18))),
          );
        }),
      );
    }
    return Column(
      children: [
        TabBar(
          controller: tabController,
          tabs: widget.tabViewModel.tabs,
          indicatorColor: normalSecondaryBrandColor,
          labelColor: normalSecondaryBrandColor,
          unselectedLabelColor: Colors.grey,
        ),
      ],
    );
  }
}
