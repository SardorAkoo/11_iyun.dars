// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:uyishi_11dars/controllers/note_controller.dart';
import 'package:uyishi_11dars/models/notes.dart';
import 'package:uyishi_11dars/utils/app_contants.dart';
import 'package:uyishi_11dars/views/widgets/add_notes.dart';
import 'package:uyishi_11dars/views/widgets/custom_drawer.dart';

class NotesScreens extends StatefulWidget {
  const NotesScreens({super.key});

  @override
  _NotesScreensState createState() => _NotesScreensState();
}

class _NotesScreensState extends State<NotesScreens> {
  final NotesController _notesController = NotesController();

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  void _loadNotes() async {
    await _notesController.fetchNotes();
    setState(() {});
  }

  void _addNotes(Notes contact) async {
    await _notesController.addNotes(contact);
    setState(() {});
  }

  void _updateNotes(Notes contact) async {
    await _notesController.updateNotes(contact);
    setState(() {});
  }

  void _deleteNotes(int id) async {
    await _notesController.deleteNotes(id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.appBarColor,
        centerTitle: true,
        title: Text(
          'Notes',
          style: TextStyle(
            fontSize: AppConstants.appBarTextSize,
            color: AppConstants.appBarTextColor,
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: _notesController.note.length,
        itemBuilder: (context, index) {
          final contact = _notesController.note[index];
          return Padding(
            padding: const EdgeInsets.all(10.5),
            child: Card(
              shadowColor: Colors.black,
              color: Colors.amber,
              child: ListTile(
                title: Text(
                  contact.name,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  contact.phone,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    size: 25,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    _deleteNotes(contact.id!);
                  },
                ),
                onTap: () async {
                  final updatedNotes = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NotesItem(notes: contact),
                    ),
                  );
                  if (updatedNotes != null) {
                    _updateNotes(updatedNotes);
                  }
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newNotes = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NotesItem(),
            ),
          );
          if (newNotes != null) {
            _addNotes(newNotes);
          }
        },
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.teal,
        ),
      ),
    );
  }
}
