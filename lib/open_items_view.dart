import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_demo/cubit/todo_cubit.dart';
import 'package:flutter_state_management_demo/to_do_item.dart';

class OpenItemsView extends StatefulWidget {
  const OpenItemsView({super.key});

  @override
  State<OpenItemsView> createState() => _OpenItemsViewState();
}

class _OpenItemsViewState extends State<OpenItemsView> {
  // Controls the text field where we add the todo item title.
  final _textEditingController = TextEditingController();

  // Responsible for managing the focus of the text field.
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Column(
      children: [
        TextField(
          textInputAction: TextInputAction.done,
          controller: _textEditingController,
          focusNode: _focusNode,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            hintText: 'Enter a todo item',
          ),
          onSubmitted: (value) {
            context.read<TodoCubit>().addTodoItem(TodoItem(title: value));
            _textEditingController.clear();

            // Refocus on the textfield after submitting a todo item.
            _focusNode.requestFocus();
          },
        ),
        Expanded(
          child: BlocBuilder<TodoCubit, TodoState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.openTodoItems.length,
                itemBuilder: (context, index) {
                  final todo = state.openTodoItems[index];
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
          ),
        ),
      ],
    );
  }
}
