import 'package:uyishi_11dars/models/notes.dart';
import 'package:uyishi_11dars/service/notes_databases.dart';

class NotesController {
  List<Notes> _notes = [];

  List<Notes> get note => _notes;

  Future<void> fetchNotes() async {
    _notes = await LocalDatabase().getAllNotes();
  }

  Future<void> addNotes(Notes notes) async {
    await LocalDatabase().addNotes(notes);
    await fetchNotes();
  }

  Future<void> updateNotes(Notes notes) async {
    await LocalDatabase().updateNotes(notes);
    await fetchNotes();
  }

  Future<void> deleteNotes(int id) async {
    await LocalDatabase().deleteNotes(id);
    await fetchNotes();
  }
}
