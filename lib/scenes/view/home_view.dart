import 'package:flutter/material.dart';
import '../../utils/navigation/app_coordinator.dart';
import '../../Components/BottomTabBar/bottom_tab_bar.dart';
import '../view_model/home/home_view_model.dart';
import '../view_model/app/app_view_model.dart';
import '../factory/notes_list_factory.dart';
import '../../Components/AppBar/custom_app_bar.dart';
import '../../Components/AppBar/custom_app_bar_view_model.dart';
import '../../Components/Avatar/user_avatar.dart';
import '../../Components/Avatar/user_avatar_view_model.dart';
import '../../Components/NotificationInput/notification_input.dart';
import '../../Components/NotificationInput/notification_config.dart';
import '../../Components/Dropdown/custom_dropdown.dart';
import '../../Components/Dropdown/dropdown_view_model.dart';

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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          UserAvatar.instantiate(
            viewModel: UserAvatarViewModel(
              name: name,
              size: UserAvatarSize.large,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(address),
        ],
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
        SwitchListTile(
          secondary: const Icon(Icons.dark_mode),
          title: const Text('Tema escuro'),
          value: Theme.of(context).brightness == Brightness.dark,
          onChanged: onToggleDark,
        ),
        const SizedBox(height: 8),
        NotificationGroup(
          title: 'Notificações',
          subtitle: 'Personalize como deseja ser avisado',
          children: [
            NotificationConfig.system(title: 'Sistema', initialValue: true),
            NotificationConfig.activity(title: 'Atividade'),
            NotificationConfig.marketing(title: 'Marketing'),
            NotificationConfig.security(title: 'Segurança'),
          ],
        ),
        const SizedBox(height: 16),
        CustomDropdown.instantiate<String>(
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
        ),
      ],
    );
  }
}
