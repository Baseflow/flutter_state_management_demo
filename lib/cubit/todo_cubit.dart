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
    final newState = state.copyWith(todoItems: updatedTodoItems);
    emit(newState);
  }

  void removeTodoItem(TodoItem todoItem) {
    // TODO: implement removing todo item.
  }

  void undoLastRemoved() {
    // TODO: Implement undoing last removed item.
  }

  void toggleTodoItem(TodoItem todo) {
    // TODO: implement toggling todo item.
  }
}
