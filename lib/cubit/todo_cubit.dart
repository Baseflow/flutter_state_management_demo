import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_demo/models/todo_item.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(const TodoState());

  void addTodoItem({required String title}) {
    final updatedTodoItems = [
      ...state.todoItems,
      TodoItem(title: title),
    ];

    emit(state.copyWith(todoItems: updatedTodoItems));
  }

  void removeTodoItem(TodoItem todoItem) {
    final updatedTodoItems = List<TodoItem>.from(state.todoItems)
      ..remove(todoItem);

    emit(state.copyWith(
      todoItems: updatedTodoItems,
      lastDeletedItem: todoItem,
    ));
  }

  void undoLastRemoved() {
    if (state.lastDeletedItem == null) return;

    final updatedTodoItems = [
      ...state.todoItems,
      state.lastDeletedItem!,
    ];

    emit(TodoState(
      todoItems: updatedTodoItems,
    ));
  }

  void toggleTodoItem(TodoItem todo) {
    final updatedTodoItems = state.todoItems.map((item) {
      if (item == todo) {
        return item.copyWith(isDone: !item.isDone);
      }
      return item;
    }).toList();

    emit(state.copyWith(todoItems: updatedTodoItems));
  }
}
