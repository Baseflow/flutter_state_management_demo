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

  blocTest<TodoCubit, TodoState>(
    'Emits a new state that no longer contains the removed todo item with title "Test"',
    build: () => TodoCubit()..addTodoItem(title: 'Test'),
    act: (cubit) => cubit.removeTodoItem(const TodoItem(title: 'Test')),
    expect: () => <TodoState>[
      const TodoState(
        todoItems: [],
        lastDeletedItem: TodoItem(title: 'Test'),
      ),
    ],
  );

  blocTest<TodoCubit, TodoState>(
    "Emits a new state where the todo item with title 'Test' `isDone` property is set to true",
    build: () => TodoCubit()..addTodoItem(title: 'Test'),
    act: (cubit) => cubit.toggleTodoItem(const TodoItem(title: 'Test')),
    expect: () => <TodoState>[
      const TodoState(
        todoItems: [
          TodoItem(title: 'Test', isDone: true),
        ],
      ),
    ],
  );

  // Create a test that verifies that the `undoRemovedItem` method emits a new
  // state where the last removed item is added back to the list.
  blocTest<TodoCubit, TodoState>(
    "Emits a new state where the last removed item is added back to the list",
    build: () => TodoCubit(),
    seed: () {
      return const TodoState(
        todoItems: [],
        lastDeletedItem: TodoItem(title: 'Test'),
      );
    },
    act: (cubit) => cubit.undoLastRemoved(),
    expect: () => <TodoState>[
      const TodoState(
        todoItems: [
          TodoItem(title: 'Test'),
        ],
        lastDeletedItem: null,
      ),
    ],
  );
}
