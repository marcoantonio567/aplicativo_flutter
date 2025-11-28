import '../../model/notes/note.dart';

class NotesService {
  NotesService._internal();
  static final NotesService _instance = NotesService._internal();
  factory NotesService() => _instance;
  final List<Note> _store = [];

  Future<List<Note>> fetchAll() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return List<Note>.unmodifiable(_store);
  }

  Future<Note> create({required String title, required String content}) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final note = Note(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: title,
      content: content,
    );
    _store.insert(0, note);
    return note;
  }

  Future<void> delete(String id) async {
    await Future.delayed(const Duration(milliseconds: 150));
    _store.removeWhere((n) => n.id == id);
  }

  Future<Note?> getById(String id) async {
    await Future.delayed(const Duration(milliseconds: 150));
    try {
      return _store.firstWhere((n) => n.id == id);
    } catch (_) {
      return null;
    }
  }

  Future<Note?> update(String id, {required String title, required String content}) async {
    await Future.delayed(const Duration(milliseconds: 200));
    for (var i = 0; i < _store.length; i++) {
      if (_store[i].id == id) {
        _store[i] = _store[i].copyWith(title: title, content: content);
        return _store[i];
      }
    }
    return null;
  }
}
