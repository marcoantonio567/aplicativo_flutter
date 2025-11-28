import 'package:flutter/widgets.dart';
import '../../utils/navigation/app_coordinator.dart';
import 'home_view.dart';
import 'home_view_model.dart';
import '../app/app_view_model.dart';

class HomeFactory {
  static Widget make({
    required AppCoordinator coordinator,
    required AppViewModel appViewModel,
  }) {
    final viewModel = HomeViewModel();
    return HomeView(
      coordinator: coordinator,
      viewModel: viewModel,
      appViewModel: appViewModel,
    );
  }
}
