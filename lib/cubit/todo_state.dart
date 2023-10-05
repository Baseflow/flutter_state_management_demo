part of 'todo_cubit.dart';

/// The state of the list the list of [TodoItem]s.
class TodoState extends Equatable {
  const TodoState({
    this.todoItems = const [],
  });

  /// The list of [TodoItem]s.
  final List<TodoItem> todoItems;

  List<TodoItem> get openTodoItems =>
      todoItems.where((todo) => !todo.isDone).toList();

  List<TodoItem> get closedTodoItems =>
      todoItems.where((todo) => todo.isDone).toList();

  @override
  List<Object> get props => [todoItems];

  /// Returns a copy of the current [TodoState] with the provided values
  /// overridden.
  TodoState copyWith({
    List<TodoItem>? todoItems,
  }) {
    return TodoState(
      todoItems: todoItems ?? this.todoItems,
    );
  }
}
