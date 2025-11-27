import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../shared/spacing.dart';
import '../Avatar/user_avatar.dart';
import '../Avatar/user_avatar_view_model.dart';
import '../Buttons/ActionButton/action_button.dart';
import '../Buttons/ActionButton/action_button_view_model.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String address;
  final VoidCallback? onEdit;

  const ProfileHeader._({super.key, required this.name, required this.address, this.onEdit});

  static Widget instantiate({Key? key, required String name, required String address, VoidCallback? onEdit}) {
    return ProfileHeader._(key: key, name: name, address: address, onEdit: onEdit);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [lightSecondaryBrandColor, normalSecondaryBrandColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(radiusLg),
      ),
      child: Padding(
        padding: const EdgeInsets.all(spaceMd),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UserAvatar.instantiate(
              viewModel: UserAvatarViewModel(
                name: name,
                size: UserAvatarSize.medium,
              ),
            ),
            const SizedBox(width: spaceMd),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: heading5Regular.copyWith(
                      color: lightTertiaryBaseColorLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: spaceXs),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: lightTertiaryBaseColorLight,
                        size: iconSizeSm,
                      ),
                      const SizedBox(width: spaceXs),
                      Expanded(
                        child: Text(
                          address,
                          style: paragraph2Medium.copyWith(
                            color: lightTertiaryBaseColorLight,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: spaceXs),
                  ActionButton.instantiate(
                    viewModel: ActionButtonViewModel(
                      size: ActionButtonSize.medium,
                      style: ActionButtonStyle.clear,
                      text: 'Editar perfil',
                      rightIcon: Icons.edit_outlined,
                      onPressed: onEdit ?? () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
