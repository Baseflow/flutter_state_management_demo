part of 'todo_cubit.dart';

/// Base ToDo state.
sealed class TodoState extends Equatable {
  const TodoState({
    this.todoItems = const [],
    this.lastRemovedItem,
  });

  final List<TodoItem> todoItems;
  final TodoItem? lastRemovedItem;
}

/// The todo state when there are items.
class PopulatedTodoState extends TodoState {
  const PopulatedTodoState({
    required super.todoItems,
    super.lastRemovedItem,
  });

  @override
  List<Object?> get props => [todoItems, lastRemovedItem];
}

/// The todo state when there are no items.
class EmptyTodoState extends TodoState {
  const EmptyTodoState({super.lastRemovedItem}) : super(todoItems: const []);

  @override
  // TODO: implement props
  List<Object?> get props => [lastRemovedItem];
}
