import 'package:flutter/material.dart';
import 'package:flutter_state_management_demo/models/todo_item.dart';
import 'package:flutter_state_management_demo/views/todo_item_list_tile.dart';

class ClosedTodoItemsTabView extends StatefulWidget {
  const ClosedTodoItemsTabView(
    this._todoItems, {
    super.key,
  });

  final List<TodoItem> _todoItems;

  @override
  State<ClosedTodoItemsTabView> createState() => _ClosedTodoItemsTabViewState();
}

class _ClosedTodoItemsTabViewState extends State<ClosedTodoItemsTabView> {
  TodoItem? _lastDeletedItem;

  @override
  Widget build(BuildContext context) {
    // TODO: How are we only showing closed todo items?
    return ListView.builder(
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
