import 'package:flutter/material.dart';
import 'avatar_config.dart';
import 'avatar_theme.dart';
import '../../shared/shimmer.dart';

class CustomAvatar extends StatelessWidget {
  final AvatarConfig config;
  final VoidCallback? onTap;

  const CustomAvatar({
    super.key,
    required this.config,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = AvatarTheme.getSizeValue(config.size);
    if (config.isLoading) {
      return ShimmerContainer(
        width: size,
        height: size,
        borderRadius: BorderRadius.circular(size / 2),
      );
    }
    final backgroundColor = config.backgroundColor ?? AvatarTheme.getDefaultBackgroundColor();
    final textColor = config.textColor ?? AvatarTheme.getDefaultTextColor();
    final borderColor = config.borderColor ?? AvatarTheme.getDefaultBorderColor();
    final borderWidth = config.borderWidth ?? AvatarTheme.getDefaultBorderWidth();

    Widget avatar = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: _buildAvatarContent(textColor),
    );

    if (onTap != null) {
      avatar = InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(size / 2),
        child: avatar,
      );
    }

    if (config.showBadge) {
      avatar = Stack(
        clipBehavior: Clip.none,
        children: [
          avatar,
          _buildBadge(),
        ],
      );
    }

    return avatar;
  }

  Widget _buildAvatarContent(Color textColor) {
    switch (config.type) {
      case AvatarType.image:
        return _buildImageAvatar();
      case AvatarType.initials:
        return _buildInitialsAvatar(textColor);
      case AvatarType.icon:
        return _buildIconAvatar(textColor);
    }
  }

  Widget _buildImageAvatar() {
    if (config.imageUrl == null || config.imageUrl!.isEmpty) {
      return _buildInitialsAvatar(config.textColor ?? AvatarTheme.getDefaultTextColor());
    }

    return ClipOval(
      child: Image.network(
        config.imageUrl!,
        fit: BoxFit.cover,
        width: AvatarTheme.getSizeValue(config.size),
        height: AvatarTheme.getSizeValue(config.size),
        errorBuilder: (context, error, stackTrace) {
          return _buildInitialsAvatar(config.textColor ?? AvatarTheme.getDefaultTextColor());
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                  : null,
              strokeWidth: 2.0,
              valueColor: AlwaysStoppedAnimation<Color>(
                config.textColor ?? AvatarTheme.getDefaultTextColor(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInitialsAvatar(Color textColor) {
    final initials = config.initials ?? '?';
    final textStyle = AvatarTheme.getTextStyle(config.size).copyWith(color: textColor);

    return Center(
      child: Text(
        initials.toUpperCase(),
        style: textStyle,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildIconAvatar(Color textColor) {
    final icon = config.icon ?? Icons.person;
    final iconSize = AvatarTheme.getIconSize(config.size);

    return Center(
      child: Icon(
        icon,
        color: textColor,
        size: iconSize,
      ),
    );
  }

  Widget _buildBadge() {
    final badgeSize = AvatarTheme.getBadgeSize(config.size);
    final badgeOffset = AvatarTheme.getBadgeOffset(config.size);
    final badgeColor = config.badgeColor ?? AvatarTheme.getDefaultBadgeColor();

    return Positioned(
      top: badgeOffset,
      right: badgeOffset,
      child: config.badgeWidget ??
          Container(
            width: badgeSize,
            height: badgeSize,
            decoration: BoxDecoration(
              color: badgeColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
            ),
          ),
    );
  }
}

// Widget helper para criar avatares rapidamente
class QuickAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? initials;
  final IconData? icon;
  final AvatarSize size;
  final VoidCallback? onTap;
  final bool showBadge;

  const QuickAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.icon,
    this.size = AvatarSize.medium,
    this.onTap,
    this.showBadge = false,
  });

  @override
  Widget build(BuildContext context) {
    AvatarType type = AvatarType.initials;
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      type = AvatarType.image;
    } else if (icon != null) {
      type = AvatarType.icon;
    }

    return CustomAvatar(
      config: AvatarConfig(
        size: size,
        type: type,
        imageUrl: imageUrl,
        initials: initials,
        icon: icon,
        showBadge: showBadge,
      ),
      onTap: onTap,
    );
  }
}