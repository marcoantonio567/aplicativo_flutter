import 'package:flutter/foundation.dart';
import '../../../repository/notes/notes_repository.dart';
import '../../../model/notes/note.dart';
import '../../../utils/navigation/app_coordinator.dart';

class NotesListViewModel {
  final NotesRepository repository;
  final AppCoordinator coordinator;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<List<Note>> notes = ValueNotifier<List<Note>>([]);
  final ValueNotifier<String?> errorMessage = ValueNotifier<String?>(null);

  NotesListViewModel({required this.repository, required this.coordinator});

  Future<void> load() async {
    isLoading.value = true;
    errorMessage.value = null;
    try {
      final data = await repository.list();
      notes.value = data;
    } catch (e) {
      errorMessage.value = 'Falha ao carregar notas';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> add(String title, String content) async {
    isLoading.value = true;
    try {
      final created = await repository.add(title, content);
      notes.value = [created, ...notes.value];
    } catch (_) {
      errorMessage.value = 'Falha ao adicionar nota';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> remove(String id) async {
    try {
      await repository.remove(id);
      notes.value = notes.value.where((n) => n.id != id).toList();
    } catch (_) {
      errorMessage.value = 'Falha ao remover nota';
    }
  }

  Future<void> openDetail(String id) async {
    final result = await coordinator.goToNoteDetail(id);
    if (result != null) {
      notes.value = notes.value.where((n) => n.id != result).toList();
    }
  }

  void dispose() {
    isLoading.dispose();
    notes.dispose();
    errorMessage.dispose();
  }
}
