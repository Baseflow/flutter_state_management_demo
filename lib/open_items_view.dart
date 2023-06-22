import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_demo/cubit/todo_cubit.dart';
import 'package:flutter_state_management_demo/to_do_item.dart';

class OpenItemsView extends StatefulWidget {
  const OpenItemsView({super.key});

  @override
  _OpenItemsViewState createState() => _OpenItemsViewState();
}

class _OpenItemsViewState extends State<OpenItemsView> {
  final _textEditingController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            context.read<TodoCubit>().addItem(value);
            _textEditingController.clear();
            _focusNode.requestFocus();
          },
        ),
        Expanded(
          child: BlocBuilder<TodoCubit, TodoState>(
            builder: (context, state) {
              return switch (state) {
                PopulatedTodoState _ => _TodoItemsView(
                    openItems: state.todoItems
                        .where((element) => !element.isDone)
                        .toList(),
                  ),
                _ => const Center(
                    child: Text('No items yet, please add some.'),
                  ),
              };
            },
          ),
        ),
      ],
    );
  }
}

class _TodoItemsView extends StatelessWidget {
  const _TodoItemsView({
    required this.openItems,
  });

  final List<TodoItem> openItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: openItems.length,
      itemBuilder: (BuildContext context, int index) {
        final todo = openItems[index];
        return ListTile(
          title: Text('${index + 1}. ${todo.title}'),
          leading: Checkbox(
            value: todo.isDone,
            onChanged: (_) {
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
  }
}
