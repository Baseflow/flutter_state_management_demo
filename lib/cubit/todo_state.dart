part of 'todo_cubit.dart';

/// The state of the list the list of [TodoItem]s.
@immutable
class TodoState extends Equatable {
  const TodoState({
    this.lastRemovedItem,
    this.isLoading = false,
    this.todoItems = const [],
  });

  /// Whether something is loading.
  final bool isLoading;

  /// The list of [TodoItem]s.
  final List<TodoItem> todoItems;

  /// The last removed [TodoItem].
  final TodoItem? lastRemovedItem;

  List<TodoItem> get openTodoItems =>
      todoItems.where((todo) => !todo.isDone).toList();

  List<TodoItem> get closedTodoItems =>
      todoItems.where((todo) => todo.isDone).toList();

  @override
  List<Object?> get props => [todoItems, lastRemovedItem, isLoading];

  /// Returns a copy of the current [TodoState] with the provided values
  /// overridden.
  TodoState copyWith({
    List<TodoItem>? todoItems,
    TodoItem? lastRemovedItem,
    bool? isLoading,
  }) {
    return TodoState(
      todoItems: todoItems ?? this.todoItems,
      lastRemovedItem: lastRemovedItem ?? this.lastRemovedItem,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
