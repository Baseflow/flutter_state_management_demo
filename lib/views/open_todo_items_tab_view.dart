import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_demo/cubit/todo_cubit.dart';
import 'package:flutter_state_management_demo/views/todo_item_list_tile.dart';

class OpenTodoItemsTabView extends StatelessWidget {
  const OpenTodoItemsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _AddTodoTextField(),
        Expanded(
          child: BlocBuilder<TodoCubit, TodoState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.openTodoItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final todo = state.openTodoItems[index];
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
          ),
        ),
      ],
    );
  }
}

class _AddTodoTextField extends StatefulWidget {
  const _AddTodoTextField();

  @override
  State<_AddTodoTextField> createState() => _AddTodoTextFieldState();
}

class _AddTodoTextFieldState extends State<_AddTodoTextField> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      controller: _controller,
      decoration: const InputDecoration(
        hintText: 'Enter a new todo item',
        contentPadding: EdgeInsets.all(16),
      ),
      onSubmitted: (value) {
        context.read<TodoCubit>().addTodoItem(title: value);
        _controller.clear();
        _focusNode.requestFocus();
      },
    );
  }
}
