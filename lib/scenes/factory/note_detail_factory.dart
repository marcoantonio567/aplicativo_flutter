import 'package:flutter/widgets.dart';
import '../../utils/navigation/app_coordinator.dart';
import '../../scenes/services/notes/notes_service.dart';
import '../../repository/notes/notes_repository.dart';
import '../view_model/notes/note_detail_view_model.dart';
import '../view/note_detail_view.dart';

class NoteDetailFactory {
  static Widget make({
    required AppCoordinator coordinator,
    required String noteId,
  }) {
    final service = NotesService();
    final repository = NotesRepository(service: service);
    final viewModel = NoteDetailViewModel(
      repository: repository,
      coordinator: coordinator,
      noteId: noteId,
    );
    return NoteDetailView(viewModel: viewModel);
  }
}
