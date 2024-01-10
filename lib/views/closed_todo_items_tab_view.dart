import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_demo/cubit/todo_cubit.dart';
import 'package:flutter_state_management_demo/models/todo_item.dart';
import 'package:flutter_state_management_demo/views/todo_item_list_tile.dart';

class ClosedTodoItemsTabView extends StatelessWidget {
  const ClosedTodoItemsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TodoCubit, TodoState, List<TodoItem>>(
      selector: (state) => state.closedTodoItems,
      builder: (context, closedItems) {
        return ListView.builder(
          itemCount: closedItems.length,
          itemBuilder: (BuildContext context, int index) {
            final todo = closedItems[index];
            return TodoItemListTile(
              todo,
              onRemove: () {
                context.read<TodoCubit>().removeTodoItem(todo);
              },
              onChanged: () {
                context.read<TodoCubit>().toggleTodoItem(todo);
              },
            );
          },
        );
      },
    );
  }
}
