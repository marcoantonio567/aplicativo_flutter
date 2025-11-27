import 'package:flutter/material.dart';
import '../../scenes/factory/home_factory.dart';
import '../../shared/navigation_helper.dart';
import '../../scenes/factory/notes_list_factory.dart';
import '../../scenes/factory/note_detail_factory.dart';
import '../../scenes/view_model/app/app_view_model.dart';

/// Coordenador de navegação.
/// Mantém referência ao `Navigator` e centraliza navegação entre telas.
class AppCoordinator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  AppViewModel? appViewModel;
  String? userName;
  String? userAddress;

  void goToHome({required String name, required String address}) {
    final context = navigatorKey.currentContext;
    userName = name;
    userAddress = address;
    if (context != null) {
      NavigationHelper.navigateAndReplace(
        context,
        HomeFactory.make(coordinator: this, appViewModel: appViewModel!),
      );
    }
  }

  void goToNotes() {
    final context = navigatorKey.currentContext;
    if (context != null) {
      NavigationHelper.navigateTo(
        context,
        NotesListFactory.make(coordinator: this),
      );
    }
  }

  Future<String?> goToNoteDetail(String noteId) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      return NavigationHelper.navigateTo<String?>(
        context,
        NoteDetailFactory.make(coordinator: this, noteId: noteId),
      );
    }
    return Future.value(null);
  }

  void pop<T extends Object?>([T? result]) {
    final state = navigatorKey.currentState;
    state?.pop(result);
  }
}
