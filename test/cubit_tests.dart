import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_state_management_demo/cubit/todo_cubit.dart';
import 'package:flutter_state_management_demo/models/todo_item.dart';

main() {
  blocTest<TodoCubit, TodoState>(
    'Emits a new state with the added todo item with title "Test".',
    build: () => TodoCubit(),
    act: (cubit) {
      cubit.addTodoItem(title: 'Test');
    },
    expect: () => <TodoState>[
      const TodoState(
        todoItems: [
          TodoItem(title: 'Test'),
        ],
      ),
    ],
  );

  // TODO: Add tests for the other cubit methods.
}
