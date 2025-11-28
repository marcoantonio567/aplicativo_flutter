import 'package:flutter/material.dart';
import '../../shared/styles.dart';
import '../../shared/colors.dart';
import 'custom_app_bar_view_model.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final CustomAppBarViewModel viewModel;

  const CustomAppBar._({super.key, required this.viewModel});

  static PreferredSizeWidget instantiate({
    Key? key,
    required CustomAppBarViewModel viewModel,
  }) {
    return CustomAppBar._(key: key, viewModel: viewModel);
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: viewModel.leading == null,
      leading: viewModel.leading,
      centerTitle: viewModel.centerTitle,
      title: Text(viewModel.title, style: navbarSmallTitle),
      actions: viewModel.actions,
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 0,
      scrolledUnderElevation: 2,
      surfaceTintColor: normalSecondaryBrandColor.withValues(alpha: 0.05),
    );
  }
}
