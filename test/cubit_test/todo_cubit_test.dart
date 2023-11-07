import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_state_management_demo/cubit/todo_cubit.dart';
import 'package:flutter_state_management_demo/to_do_item.dart';

main() {
  blocTest<TodoCubit, TodoState>(
    'Emits a new state with the added todo item with title "Test"',
    build: () => TodoCubit(),
    act: (cubit) {
      const todoItem = TodoItem(title: 'Test');
      cubit.addTodoItem(todoItem);
    },
    expect: () => <TodoState>[
      const TodoState(
        todoItems: [
          TodoItem(title: 'Test1'),
        ],
      ),
    ],
  );

  blocTest<TodoCubit, TodoState>(
    'Emits a new state that no longer contains the removed todo item with title "Test"',
    build: () => TodoCubit()..addTodoItem(const TodoItem(title: 'Test')),
    act: (cubit) => cubit.removeTodoItem(const TodoItem(title: 'Test')),
    expect: () => <TodoState>[
      const TodoState(
        todoItems: [
          TodoItem(title: 'Test'),
        ],
        isLoading: true,
      ),
      const TodoState(
        todoItems: [],
        lastRemovedItem: TodoItem(title: 'Test'),
        isLoading: false,
      ),
    ],
  );

  blocTest<TodoCubit, TodoState>(
    "Emits a new state where the todo item with title 'Test' `isDone` property is set to true",
    build: () => TodoCubit()..addTodoItem(const TodoItem(title: 'Test')),
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
        lastRemovedItem: TodoItem(title: 'Test'),
      );
    },
    act: (cubit) => cubit.undoRemovedItem(),
    expect: () => <TodoState>[
      const TodoState(
        todoItems: [
          TodoItem(title: 'Test'),
        ],
        lastRemovedItem: null,
      ),
    ],
  );
}
