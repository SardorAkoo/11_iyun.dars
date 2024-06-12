class TodoApp {
  String title;
  String description;
  bool isCompleted;

  TodoApp({
    required this.title,
    required this.description,
    this.isCompleted = false,
  });
}
