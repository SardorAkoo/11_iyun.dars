import 'package:flutter/material.dart';
import 'package:uyishi_11dars/models/todo.dart';
import 'package:uyishi_11dars/utils/app_contants.dart';

class TodoAppAdd extends StatefulWidget {
  final TodoApp? todoApp;
  final ValueChanged<TodoApp> onSave;

  const TodoAppAdd({
    super.key,
    this.todoApp,
    required this.onSave,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TodoAppAddState createState() => _TodoAppAddState();
}

class _TodoAppAddState extends State<TodoAppAdd> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(
      text: widget.todoApp?.title ?? '',
    );
    _descriptionController = TextEditingController(
      text: widget.todoApp?.description ?? '',
    );
    _isCompleted = widget.todoApp?.isCompleted ?? false;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveTodo() {
    if (_titleController.text.isEmpty || _descriptionController.text.isEmpty) {
      return;
    }
    widget.onSave(
      TodoApp(
        title: _titleController.text,
        description: _descriptionController.text,
        isCompleted: _isCompleted,
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.todoApp == null ? 'Add Todo' : 'Edit Todo',
        style: TextStyle(
          fontSize: AppConstants.appBarTextSize,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(fontSize: 18),
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(fontSize: 18),
              ),
            ),
            SwitchListTile(
              title: const Text(
                'Completed',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              value: _isCompleted,
              onChanged: (value) {
                setState(() {
                  _isCompleted = value;
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _saveTodo,
          child: const Text(
            'Save',
            style: TextStyle(fontSize: 18),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
