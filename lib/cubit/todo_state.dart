part of 'todo_cubit.dart';

class TodoState extends Equatable {
  const TodoState({
    this.todoItems = const [],
    this.lastDeletedItem,
  });

  final List<TodoItem> todoItems;
  final TodoItem? lastDeletedItem;

  List<TodoItem> get openTodoItems =>
      todoItems.where((todo) => !todo.isDone).toList();
  List<TodoItem> get closedTodoItems =>
      todoItems.where((todo) => todo.isDone).toList();

  @override
  List<Object?> get props => [
        todoItems,
        lastDeletedItem,
      ];

  TodoState copyWith({
    List<TodoItem>? todoItems,
    TodoItem? lastDeletedItem,
  }) {
    return TodoState(
      todoItems: todoItems ?? this.todoItems,
      lastDeletedItem: lastDeletedItem ?? this.lastDeletedItem,
    );
  }
}
