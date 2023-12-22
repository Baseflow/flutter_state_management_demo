class TodoItem {
  TodoItem({
    required this.title,
    this.isDone = false,
  });

  final String title;
  final bool isDone;

  TodoItem copyWith({
    String? title,
    bool? isDone,
  }) {
    return TodoItem(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }
}
