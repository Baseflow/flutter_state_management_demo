import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_demo/cubit/todo_cubit.dart';
import 'package:flutter_state_management_demo/to_do_item.dart';

class ClosedItemsView extends StatelessWidget {
  const ClosedItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TodoCubit, TodoState, List<TodoItem>>(
      selector: (state) => state.todoItems,
      builder: (context, state) {
        final closedItems = state.where((todo) => todo.isDone).toList();
        return ListView.builder(
          itemCount: closedItems.length,
          itemBuilder: (BuildContext context, int index) {
            final todo = closedItems[index];
            return ListTile(
              title: Text('${index + 1}. ${todo.title}'),
              leading: Checkbox(
                value: todo.isDone,
                onChanged: (value) {
                  context.read<TodoCubit>().toggleItem(todo);
                },
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  context.read<TodoCubit>().removeItem(todo);
                },
              ),
            );
          },
        );
      },
    );
  }
}
