import 'package:flutter/material.dart';
import 'package:uyishi_11dars/models/notes.dart';

class NotesItem extends StatelessWidget {
  final Notes? notes;

  NotesItem({super.key, this.notes});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (notes != null) {
      _titleController.text = notes!.name;
      _contentController.text = notes!.phone;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade600,
        centerTitle: true,
        title: Text(
          notes == null ? 'Add Notes' : 'Edit Notes',
          style: const TextStyle(
            fontSize: 23,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                  labelText: 'title', focusColor: Colors.white),
            ),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(labelText: 'content'),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          final newContact = Notes(
            id: notes?.id,
            name: _titleController.text,
            phone: _contentController.text,
          );
          Navigator.of(context).pop(newContact);
        },
        child: const Text(
          'Save',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

