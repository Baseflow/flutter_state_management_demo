import 'package:flutter/material.dart';
import 'package:flutter_state_management_demo/models/todo_item.dart';
import 'package:flutter_state_management_demo/views/todo_item_list_tile.dart';

class OpenTodoItemsTabView extends StatefulWidget {
  const OpenTodoItemsTabView(
    this._todoItems, {
    super.key,
  });

  final List<TodoItem> _todoItems;

  @override
  State<OpenTodoItemsTabView> createState() => _OpenTodoItemsTabViewState();
}

class _OpenTodoItemsTabViewState extends State<OpenTodoItemsTabView> {
  final TextEditingController _controller = TextEditingController();
  final _focusNode = FocusNode();

  TodoItem? _lastDeletedItem;

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          focusNode: _focusNode,
          controller: _controller,
          decoration: const InputDecoration(
            hintText: 'Enter a new todo item',
            contentPadding: EdgeInsets.all(16),
          ),
          onSubmitted: (value) {
            setState(() {
              widget._todoItems.add(TodoItem(title: value));
            });
            _controller.clear();
            _focusNode.requestFocus();
          },
        ),
        Expanded(
          // TODO: How are we only showing open todo items?
          child: ListView.builder(
            itemCount: widget._todoItems.length,
            itemBuilder: (BuildContext context, int index) {
              final todo = widget._todoItems[index];
              return TodoItemListTile(
                todo,
                onRemove: () => _removeTodoItem(todo),
                onUndo: _undoLastRemoved,
                onChanged: () {
                  // TODO: implement toggling todo item.
                },
              );
            },
          ),
        ),
      ],
    );
  }

  void _undoLastRemoved() {
    // TODO: implement undoing last removed item.
  }

  void _removeTodoItem(TodoItem todo) {
    // TODO: implement removing todo item.
    setState(() {
      _lastDeletedItem = todo;
    });
  }
}
