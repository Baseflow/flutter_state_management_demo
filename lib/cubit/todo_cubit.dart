import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_demo/to_do_item.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(const TodoState());

  void addItem(String value) {
    final updatedList = List<TodoItem>.from(state.todoItems);
    updatedList.add(TodoItem(title: value));
    emit(state.copyWith(
      todoItems: updatedList,
    ));
  }

  void toggleItem(TodoItem todo) {
    final index = state.todoItems.indexOf(todo);
    final updatedTodo = todo.copyWith(isDone: !todo.isDone);
    final updatedList = List<TodoItem>.from(state.todoItems);
    updatedList[index] = updatedTodo;

    emit(state.copyWith(todoItems: updatedList));
  }

  void removeItem(TodoItem todo) {
    final updatedList = List<TodoItem>.from(state.todoItems);
    updatedList.remove(todo);

    emit(state.copyWith(
      todoItems: updatedList,
      lastRemovedItem: todo,
    ));
  }

  void undoRemoveItem() {
    final updatedList = List<TodoItem>.from(state.todoItems);
    updatedList.add(state.lastRemovedItem!);

    emit(state.copyWith(
      todoItems: updatedList,
      lastRemovedItem: null,
    ));
  }
}
