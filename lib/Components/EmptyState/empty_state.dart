import 'package:flutter/material.dart';
import '../../shared/spacing.dart';
import '../../shared/styles.dart';
import '../../shared/colors.dart';
import 'empty_state_view_model.dart';

class EmptyState extends StatelessWidget {
  final EmptyStateViewModel viewModel;

  const EmptyState._({super.key, required this.viewModel});

  static Widget instantiate({Key? key, required EmptyStateViewModel viewModel}) {
    return EmptyState._(key: key, viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(spaceLg),
      decoration: BoxDecoration(
        color: lightTertiaryBaseColorLight,
        borderRadius: BorderRadius.circular(radiusLg),
        border: Border.all(
          color: normalSecondaryBaseColorLight.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            viewModel.icon,
            color: normalSecondaryBrandColor,
            size: 48,
          ),
          const SizedBox(height: spaceMd),
          Text(
            viewModel.title,
            style: heading5Regular,
            textAlign: TextAlign.center,
          ),
          if (viewModel.subtitle != null) ...[
            const SizedBox(height: spaceSm),
            Text(
              viewModel.subtitle!,
              style: paragraph2Medium.copyWith(color: normalSecondaryBaseColorLight),
              textAlign: TextAlign.center,
            ),
          ],
          if (viewModel.actionText != null && viewModel.onActionPressed != null) ...[
            const SizedBox(height: spaceMd),
            TextButton.icon(
              onPressed: viewModel.onActionPressed,
              icon: const Icon(Icons.add, color: normalSecondaryBrandColor),
              label: Text(
                viewModel.actionText!,
                style: label1Semibold.copyWith(color: normalSecondaryBrandColor),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

