import 'package:flutter/material.dart';
import '../../scenes/factory/home_factory.dart';
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              HomeFactory.make(coordinator: this, appViewModel: appViewModel!),
        ),
      );
    }
  }

  void goToNotes() {
    final context = navigatorKey.currentContext;
    if (context != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => NotesListFactory.make(coordinator: this),
        ),
      );
    }
  }

  Future<String?> goToNoteDetail(String noteId) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      return Navigator.push<String?>(
        context,
        MaterialPageRoute(
          builder: (_) =>
              NoteDetailFactory.make(coordinator: this, noteId: noteId),
        ),
      );
    }
    return Future.value(null);
  }

  void pop<T extends Object?>([T? result]) {
    final state = navigatorKey.currentState;
    state?.pop(result);
  }
}
