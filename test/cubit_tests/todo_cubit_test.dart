import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_state_management_demo/cubit/todo_cubit.dart';
import 'package:flutter_state_management_demo/to_do_item.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group(
    'toggleItem',
    () {
      blocTest(
        'toggles successful',
        build: () => TodoCubit()..addItem('Test1'),
        act: (TodoCubit cubit) => cubit.toggleItem(
          cubit.state.todoItems.first,
        ),
        expect: () => [
          const PopulatedTodoState(
            todoItems: [
              TodoItem(title: 'Test1', isDone: true),
            ],
          ),
        ],
      );
    },
  );

  group(
    'removeItem',
    () {
      test(
        'sets the lastRemovedItem to the item most recently removed',
        () {
          // Arrange
          final cubit = TodoCubit()..addItem('Test1');
          final todoItem = cubit.state.todoItems.first;

          // Act
          cubit.removeItem(todoItem);

          // Assert
          expect(
            cubit.state.lastRemovedItem,
            todoItem,
          );
        },
      );
      group(
        'handles items with identical titles',
        () {
          late TodoCubit cubit;
          const title = 'Test1';
          const todoToDuplicate = TodoItem(title: title);
          setUp(() {
            cubit = TodoCubit()
              ..addItem(title)
              ..addItem(title);
          });
          blocTest(
            'and identical isDone values',
            build: () => cubit,
            act: (cubit) => cubit.removeItem(
              cubit.state.todoItems.first,
            ),
            expect: () => [
              const PopulatedTodoState(
                todoItems: [todoToDuplicate],
                lastRemovedItem: todoToDuplicate,
              ),
            ],
          );

          blocTest(
            'and different isDone values',
            build: () => cubit,
            act: (cubit) => cubit.removeItem(
              cubit.state.todoItems.first,
            ),
            expect: () => [
              const PopulatedTodoState(
                todoItems: [todoToDuplicate],
                lastRemovedItem: todoToDuplicate,
              ),
            ],
          );
        },
      );
    },
  );

  group(
    'undoRemovedItem',
    () {
      late TodoCubit cubit;
      setUp(
        () => cubit = TodoCubit()..addItem('Test1'),
      );
      blocTest(
        'brings back the most recently removed item',
        build: () => cubit
          ..removeItem(
            cubit.state.todoItems.first,
          ),
        act: (cubit) => cubit.undoRemovedItem(),
        expect: () => [
          const PopulatedTodoState(
            todoItems: [TodoItem(title: 'Test1')],
          ),
        ],
      );
      // blocTest(
      //   'brings back the most recently removed item',
      //   build: () => cubit
      //     ..removeItem(
      //       cubit.state.todoItems.first,
      //     ),
      //   act: (cubit) => cubit.undoRemovedItem(),
      //   expect: () => [
      //     const PopulatedTodoState(
      //       lastRemovedItem: null,
      //     ),
      //   ],
      // );
    },
  );
}
