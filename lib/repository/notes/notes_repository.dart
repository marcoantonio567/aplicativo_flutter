import '../../model/notes/note.dart';
import '../../scenes/services/notes/notes_service.dart';

class NotesRepository {
  final NotesService service;

  NotesRepository({required this.service});

  Future<List<Note>> list() => service.fetchAll();
  Future<Note> add(String title, String content) => service.create(title: title, content: content);
  Future<void> remove(String id) => service.delete(id);
  Future<Note?> byId(String id) => service.getById(id);
  Future<Note?> update(String id, String title, String content) => service.update(id, title: title, content: content);
}
