import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_demo/cubit/todo_cubit.dart';

class ClosedItemsView extends StatelessWidget {
  const ClosedItemsView({super.key});

  @override
  Widget build(context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.closedTodoItems.length,
          itemBuilder: (context, index) {
            final todo = state.closedTodoItems[index];
            return ListTile(
              title: Text(todo.title),
              leading: Checkbox(
                value: todo.isDone,
                onChanged: (_) {
                  context.read<TodoCubit>().toggleTodoItem(todo);
                },
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  context.read<TodoCubit>().removeTodoItem(todo);
                },
              ),
            );
          },
        );
      },
    );
  }
}
