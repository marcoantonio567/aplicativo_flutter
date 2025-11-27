import 'package:flutter/widgets.dart';
import '../../utils/navigation/app_coordinator.dart';
import '../../scenes/services/notes/notes_service.dart';
import '../../repository/notes/notes_repository.dart';
import '../view_model/notes/notes_list_view_model.dart';
import '../view/notes_list_view.dart';

class NotesListFactory {
  static Widget make({required AppCoordinator coordinator}) {
    final service = NotesService();
    final repository = NotesRepository(service: service);
    final viewModel = NotesListViewModel(
      repository: repository,
      coordinator: coordinator,
    );
    return NotesListView(viewModel: viewModel);
  }
}
