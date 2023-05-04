part of 'todo_cubit.dart';

class TodoState extends Equatable {
  const TodoState({
    this.todoItems = const [],
  });

  final List<ToDoItem> todoItems;

  @override
  List<Object?> get props => [todoItems];

  TodoState copyWith({
    List<ToDoItem>? todoItems,
  }) {
    return TodoState(
      todoItems: todoItems ?? this.todoItems,
    );
  }
}
