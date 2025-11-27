import 'package:flutter/material.dart';

enum UserAvatarSize { small, medium, large }

class UserAvatarViewModel {
  final String? imageUrl;
  final String? name;
  final UserAvatarSize size;
  final VoidCallback? onTap;

  const UserAvatarViewModel({
    this.imageUrl,
    this.name,
    this.size = UserAvatarSize.medium,
    this.onTap,
  });
}

