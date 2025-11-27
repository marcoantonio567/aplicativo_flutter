import 'package:flutter/widgets.dart';
import '../../utils/navigation/app_coordinator.dart';
import '../view/terms_view.dart';

class TermsFactory {
  static Widget make({required AppCoordinator coordinator}) {
    return const TermsView();
  }
}
