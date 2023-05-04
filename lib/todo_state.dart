part of 'todo_cubit.dart';

class TodoState extends Equatable {
  const TodoState({
    this.todoItems = const [],
    this.lastRemovedItem,
  });

  final List<TodoItem> todoItems;
  final TodoItem? lastRemovedItem;

  @override
  List<Object?> get props => [todoItems];

  TodoState copyWith({
    List<TodoItem>? todoItems,
    TodoItem? lastRemovedItem,
  }) {
    return TodoState(
      todoItems: todoItems ?? this.todoItems,
      lastRemovedItem: lastRemovedItem ?? this.lastRemovedItem,
    );
  }
}
