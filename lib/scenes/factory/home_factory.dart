import 'package:flutter/widgets.dart';
import '../../utils/navigation/app_coordinator.dart';
import '../view/home_view.dart';

class HomeFactory {
  static Widget make({required AppCoordinator coordinator}) {
    return const HomeView();
  }
}