import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_demo/to_do_item.dart';

part 'todo_state.dart';

/// Manages the state of the `TodoItem` list.
class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(const TodoState());

  /// Adds a new [TodoItem] to the list.
  void addTodoItem(TodoItem todoItem) {
    final todoItems = [...state.todoItems, todoItem];
    emit(state.copyWith(todoItems: todoItems));
  }

  /// Removes a [TodoItem] from the list.
  void removeTodoItem(TodoItem todoItem) {
    final todoItems = [...state.todoItems]..remove(todoItem);
    emit(state.copyWith(todoItems: todoItems));
  }

  /// Toggles the `isDone` property of a [TodoItem].
  void toggleTodoItem(TodoItem todoItem) {
    final todoItems = [...state.todoItems];
    final index = todoItems.indexOf(todoItem);
    todoItems[index] = todoItem.copyWith(isDone: !todoItem.isDone);
    emit(state.copyWith(todoItems: todoItems));
  }
}
