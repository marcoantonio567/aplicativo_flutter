import 'package:flutter/material.dart';
import '../../shared/spacing.dart';
import '../../shared/navigation_helper.dart';
import '../../Components/Card/custom_card.dart';
import '../../Components/Card/card_types.dart';
import '../../utils/navigation/app_coordinator.dart';
import '../../scenes/factory/notes_list_factory.dart';

class ProfileQuickActions extends StatelessWidget {
  final AppCoordinator coordinator;

  const ProfileQuickActions._({super.key, required this.coordinator});

  static Widget instantiate({Key? key, required AppCoordinator coordinator}) {
    return ProfileQuickActions._(key: key, coordinator: coordinator);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomCard(
            type: CardType.gradient,
            size: CardSize.small,
            title: 'Minhas Notas',
            subtitle: 'Acesse suas anotações',
            icon: Icons.sticky_note_2_outlined,
            trailing: const Icon(Icons.arrow_forward_ios, size: iconSizeSm),
            onTap: () => NavigationHelper.navigateTo(
              context,
              NotesListFactory.make(coordinator: coordinator),
            ),
          ),
        ),
        const SizedBox(width: spaceMd),
        Expanded(
          child: CustomCard(
            type: CardType.secondary,
            size: CardSize.small,
            title: 'Endereços',
            subtitle: 'Gerencie seus locais',
            icon: Icons.home_outlined,
            trailing: const Icon(Icons.arrow_forward_ios, size: iconSizeSm),
            onTap: () => NavigationHelper.navigateTo(
              context,
              Scaffold(
                appBar: AppBar(title: const Text('Meus Endereços')),
                body: const Center(child: Text('Em breve')),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
