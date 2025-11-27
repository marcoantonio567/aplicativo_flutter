import 'package:flutter/material.dart';
import '../../utils/navigation/app_coordinator.dart';
import '../../Components/BottomTabBar/bottom_tab_bar.dart';
import '../view_model/home/home_view_model.dart';
import '../view_model/app/app_view_model.dart';
import '../factory/notes_list_factory.dart';
import '../../Components/AppBar/custom_app_bar.dart';
import '../../Components/AppBar/custom_app_bar_view_model.dart';
import '../../Components/NotificationInput/notification_input.dart';
import '../../Components/NotificationInput/notification_config.dart';
import '../../Components/Dropdown/custom_dropdown.dart';
import '../../Components/Dropdown/dropdown_view_model.dart';
import '../../Components/Banner/custom_banner.dart';
import '../../Components/Banner/banner_view_model.dart';
import '../../Components/NavigationCard/navigation_card.dart';
import '../../shared/spacing.dart';
import '../../Components/Profile/profile_header.dart';
import '../../Components/Profile/profile_quick_actions.dart';
import '../../Components/Profile/profile_personal_data_card.dart';

class HomeView extends StatefulWidget {
  final AppCoordinator coordinator;
  final HomeViewModel viewModel;
  final AppViewModel appViewModel;
  const HomeView({
    super.key,
    required this.coordinator,
    required this.viewModel,
    required this.appViewModel,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: widget.viewModel.currentIndex,
      builder: (context, index, _) {
        final pages = [
          NotesListFactory.make(coordinator: widget.coordinator),
          _ProfileView(coordinator: widget.coordinator),
          _SettingsView(
            onToggleDark: (value) => widget.appViewModel.toggleDark(value),
          ),
        ];
        return Scaffold(
          appBar: CustomAppBar.instantiate(
            viewModel: const CustomAppBarViewModel(title: 'Meu App'),
          ),
          body: pages[index],
          bottomNavigationBar: BottomTabBar.instantiate(
            viewModel: widget.viewModel.buildBottomBar(),
            currentIndex: index,
          ),
        );
      },
    );
  }
}

class _ProfileView extends StatelessWidget {
  final AppCoordinator coordinator;
  const _ProfileView({required this.coordinator});
  @override
  Widget build(BuildContext context) {
    final name = coordinator.userName ?? 'Usuário';
    final address = coordinator.userAddress ?? 'Endereço não informado';
    return ListView(
      padding: const EdgeInsets.all(16),
      children: _sections(context, name, address),
    );
  }

  List<Widget> _sections(BuildContext context, String name, String address) {
    return [
      _bannerCompleteProfile(),
      ProfileHeader.instantiate(name: name, address: address, onEdit: () {}),
      const SizedBox(height: spaceLg),
      ProfileQuickActions.instantiate(coordinator: coordinator),
      const SizedBox(height: spaceLg),
      ProfilePersonalDataCard.instantiate(name: name),
      const SizedBox(height: spaceLg),
      _privacyNavigationCard(context),
    ];
  }

  Widget _bannerCompleteProfile() {
    return CustomBanner.instantiate(
      viewModel: BannerViewModel(
        title: 'Complete seu perfil',
        subtitle: 'Adicione mais detalhes para uma experiência personalizada',
        type: BannerType.info,
        icon: Icons.person_outline,
        actionText: 'Editar agora',
        onActionPressed: () {},
        showCloseButton: true,
      ),
    );
  }

  Widget _privacyNavigationCard(BuildContext context) {
    return NavigationCard(
      title: 'Privacidade e Segurança',
      description: 'Configure autenticação e privacidade da conta',
      icon: Icons.lock_outlined,
      destination: Scaffold(
        appBar: AppBar(title: const Text('Privacidade e Segurança')),
        body: ListView(
          padding: const EdgeInsets.all(spaceMd),
          children: [
            SwitchListTile(
              title: const Text('Autenticação biométrica'),
              secondary: const Icon(Icons.fingerprint),
              value: false,
              onChanged: (_) {},
            ),
            SwitchListTile(
              title: const Text('Exibir sugestão de conteúdo'),
              secondary: const Icon(Icons.recommend_outlined),
              value: true,
              onChanged: (_) {},
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsView extends StatelessWidget {
  final void Function(bool)? onToggleDark;
  const _SettingsView({this.onToggleDark});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _darkModeSwitch(context),
        const SizedBox(height: 8),
        _notificationsGroup(),
        const SizedBox(height: 16),
        _backupDropdown(),
      ],
    );
  }

  Widget _darkModeSwitch(BuildContext context) {
    return SwitchListTile(
      secondary: const Icon(Icons.dark_mode),
      title: const Text('Tema escuro'),
      value: Theme.of(context).brightness == Brightness.dark,
      onChanged: onToggleDark,
    );
  }

  Widget _notificationsGroup() {
    return NotificationGroup(
      title: 'Notificações',
      subtitle: 'Personalize como deseja ser avisado',
      children: [
        NotificationConfig.system(title: 'Sistema', initialValue: true),
        NotificationConfig.activity(title: 'Atividade'),
        NotificationConfig.marketing(title: 'Marketing'),
        NotificationConfig.security(title: 'Segurança'),
      ],
    );
  }

  Widget _backupDropdown() {
    return CustomDropdown.instantiate<String>(
      viewModel: DropdownViewModel<String>(
        items: const [
          DropdownItem(value: 'instant', label: 'Backup instantâneo'),
          DropdownItem(value: 'daily', label: 'Backup diário'),
          DropdownItem(value: 'weekly', label: 'Backup semanal'),
        ],
        selectedValue: 'daily',
        placeholder: 'Frequência de backup',
        prefixIcon: const Icon(Icons.backup_outlined),
      ),
    );
  }
}
