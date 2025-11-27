import 'package:flutter/foundation.dart';
import '../../../repository/notes/notes_repository.dart';
import '../../../model/notes/note.dart';
import '../../../utils/navigation/app_coordinator.dart';

class NoteDetailViewModel {
  final NotesRepository repository;
  final AppCoordinator coordinator;
  final String noteId;

  final ValueNotifier<Note?> note = ValueNotifier<Note?>(null);
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<String?> errorMessage = ValueNotifier<String?>(null);

  NoteDetailViewModel({
    required this.repository,
    required this.coordinator,
    required this.noteId,
  });

  Future<void> load() async {
    isLoading.value = true;
    errorMessage.value = null;
    final data = await repository.byId(noteId);
    note.value = data;
    isLoading.value = false;
  }

  Future<void> delete() async {
    await repository.remove(noteId);
  }

  Future<void> save(String title, String content) async {
    final updated = await repository.update(noteId, title, content);
    note.value = updated;
  }

  void dispose() {
    note.dispose();
    isLoading.dispose();
    errorMessage.dispose();
  }
}
