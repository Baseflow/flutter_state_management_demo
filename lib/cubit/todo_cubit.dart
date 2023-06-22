import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_demo/to_do_item.dart';

part 'todo_state.dart';

/// The state
class TodoCubit extends Cubit<TodoState> {
  /// Creates a new [TodoCubit] instance.
  TodoCubit() : super(const EmptyTodoState());

  /// Adds a new [TodoItem] to the list of todo items.
  void addItem(String value) {
    final updatedList = List<TodoItem>.from(state.todoItems);
    updatedList.add(TodoItem(title: value));
    emit(PopulatedTodoState(
      todoItems: updatedList,
      lastRemovedItem: state.lastRemovedItem,
    ));
  }

  /// Toggles the `isDone` property of the given [todo].
  void toggleItem(TodoItem todo) {
    final index = state.todoItems.indexOf(todo);
    final updatedTodo = todo.copyWith(isDone: !todo.isDone);
    final updatedList = List<TodoItem>.from(state.todoItems);
    updatedList[index] = updatedTodo;

    emit(PopulatedTodoState(
      todoItems: updatedList,
      lastRemovedItem: state.lastRemovedItem,
    ));
  }

  /// Removes the given [todo] from the list of todo items.
  void removeItem(TodoItem todo) {
    final updatedList = List<TodoItem>.from(state.todoItems);
    updatedList.remove(todo);

    if (state.todoItems.isEmpty) {
      emit(EmptyTodoState(lastRemovedItem: todo));
      return;
    }

    emit(PopulatedTodoState(
      todoItems: updatedList,
      lastRemovedItem: todo,
    ));
  }

  /// Undoes the last removed item `todo` property.
  void undoRemovedItem() {
    final updatedList = List<TodoItem>.from(state.todoItems);
    updatedList.add(state.lastRemovedItem!);

    emit(PopulatedTodoState(
      todoItems: updatedList,
      lastRemovedItem: null,
    ));
  }
}
