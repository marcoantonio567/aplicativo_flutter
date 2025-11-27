import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import 'user_avatar_view_model.dart';

class UserAvatar extends StatelessWidget {
  final UserAvatarViewModel viewModel;

  const UserAvatar._({super.key, required this.viewModel});

  static Widget instantiate({Key? key, required UserAvatarViewModel viewModel}) {
    return UserAvatar._(key: key, viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {
    final double size = switch (viewModel.size) {
      UserAvatarSize.small => 32,
      UserAvatarSize.medium => 56,
      UserAvatarSize.large => 88,
    };

    Widget child;
    if (viewModel.imageUrl != null && viewModel.imageUrl!.isNotEmpty) {
      child = ClipOval(
        child: Image.network(
          viewModel.imageUrl!,
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      );
    } else {
      final initials = _initials(viewModel.name);
      child = Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: lightSecondaryBrandColor.withValues(alpha: 0.15),
          shape: BoxShape.circle,
          border: Border.all(
            color: normalSecondaryBrandColor.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          initials,
          style: navbarSmallTitle.copyWith(color: normalSecondaryBrandColor),
        ),
      );
    }

    if (viewModel.onTap != null) {
      return InkWell(
        onTap: viewModel.onTap,
        customBorder: const CircleBorder(),
        child: child,
      );
    }
    return child;
  }

  String _initials(String? name) {
    final n = (name ?? '').trim();
    if (n.isEmpty) return 'U';
    final parts = n.split(RegExp(r"\s+")).where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return 'U';
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return (parts.first[0] + parts.last[0]).toUpperCase();
  }
}

