import 'package:flutter/material.dart';
import '../../utils/navigation/app_coordinator.dart';
import '../../Components/BottomTabBar/bottom_tab_bar.dart';
import '../view_model/home/home_view_model.dart';
import '../factory/notes_list_factory.dart';

class HomeView extends StatefulWidget {
  final AppCoordinator coordinator;
  final HomeViewModel viewModel;
  const HomeView({super.key, required this.coordinator, required this.viewModel});

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
          const _ProfileView(),
          const _SettingsView(),
        ];
        return Scaffold(
          appBar: AppBar(title: const Text('Meu App')),
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
  const _ProfileView();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SizedBox(height: 16),
          Icon(Icons.person, size: 64),
          SizedBox(height: 12),
          Text('Perfil do usuário'),
        ],
      ),
    );
  }
}

class _SettingsView extends StatelessWidget {
  const _SettingsView();
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ListTile(
          leading: Icon(Icons.dark_mode),
          title: Text('Tema escuro'),
          subtitle: Text('Em breve'),
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text('Notificações'),
          subtitle: Text('Em breve'),
        ),
      ],
    );
  }
}
