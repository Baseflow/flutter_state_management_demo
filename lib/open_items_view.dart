import 'package:flutter/material.dart';
import 'package:flutter_state_management_demo/to_do_item.dart';

class OpenItemsView extends StatefulWidget {
  const OpenItemsView(
    this.todoItems, {
    super.key,
  });

  final List<TodoItem> todoItems;

  @override
  State<OpenItemsView> createState() => _OpenItemsViewState();
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
    final openTodoItems =
        widget.todoItems.where((todo) => !todo.isDone).toList();
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
            setState(() {
              widget.todoItems.add(TodoItem(title: value));
            });
            _textEditingController.clear();
            _focusNode.requestFocus();
          },
        ),
        Expanded(
          child: ListView.builder(
            itemCount: openTodoItems.length,
            itemBuilder: (BuildContext context, int index) {
              final todo = widget.todoItems[index];
              if (todo.isDone) {
                return const SizedBox.shrink();
              }
              return ListTile(
                title: Text(todo.title),
                leading: Checkbox(
                  value: todo.isDone,
                  onChanged: (_) {
                    setState(() {
                      widget.todoItems[index] = todo.copyWith(
                        isDone: !todo.isDone,
                      );
                    });
                  },
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      openTodoItems.removeAt(index);
                    });
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
