import 'package:flutter/material.dart';
import 'package:uyishi_11dars/models/todo.dart';
import 'package:uyishi_11dars/utils/app_contants.dart';
import 'package:uyishi_11dars/views/widgets/add_todo_dialog.dart';
import 'package:uyishi_11dars/views/widgets/custom_drawer.dart';


class TodoAppScreens extends StatefulWidget {
  const TodoAppScreens({super.key});

  @override
  State<TodoAppScreens> createState() => _TodoAppScreensState();
}

class _TodoAppScreensState extends State<TodoAppScreens> {
  List<TodoApp> todos = [];

  void _addOrEditTodo([TodoApp? todo]) {
    showDialog(
      context: context,
      builder: (ctx) => TodoAppAdd(
        todoApp: todo,
        onSave: (newTodo) {
          setState(() {
            if (todo == null) {
              todos.add(newTodo);
            } else {
              final index = todos.indexOf(todo);
              todos[index] = newTodo;
            }
          });
        },
      ),
    );
  }

  void _deleteTodo(TodoApp todo) {
    setState(() {
      todos.remove(todo);
    });
  }

  void isCompleted(bool todo) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.appBarColor,
        centerTitle: true,
        title: Text(
          "Todo App",
          style: TextStyle(
            color: AppConstants.appBarTextColor,
            fontSize: AppConstants.appBarTextSize,
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (ctx, index) {
          final todo = todos[index];
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 80,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    15,
                  ),
                ),
              ),
              child: ListTile(
                leading: IconButton(
                  icon: Icon(
                    todo.isCompleted
                        ? Icons.check_box
                        : Icons.check_box_outline_blank_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      todo.isCompleted = !todo.isCompleted;
                    });
                  },
                ),
                title: Text(
                  todo.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  todo.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.blue.shade700,
                      ),
                      onPressed: () => _addOrEditTodo(todo),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red.shade700,
                      ),
                      onPressed: () => _deleteTodo(todo),
                    ),
                  ],
                ),
                onTap: () => _addOrEditTodo(todo),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple.shade700,
        onPressed: () => _addOrEditTodo(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
