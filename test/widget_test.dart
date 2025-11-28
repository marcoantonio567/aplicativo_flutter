// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:project_app_flutter/scenes/app/app_view.dart';
import 'package:project_app_flutter/utils/navigation/app_coordinator.dart';
import 'package:project_app_flutter/scenes/app/app_view_model.dart';
import 'package:project_app_flutter/scenes/app/app_settings_service.dart';
import 'package:project_app_flutter/repository/settings/app_settings_repository.dart';

void main() {
  testWidgets('AppView renders', (WidgetTester tester) async {
    final coordinator = AppCoordinator();
    final repo = AppSettingsRepository(service: AppSettingsService());
    final vm = AppViewModel(repository: repo);
    await tester.pumpWidget(AppView(coordinator: coordinator, viewModel: vm));
    expect(find.byType(AppView), findsOneWidget);
  });
}
