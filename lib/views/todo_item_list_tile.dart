import 'package:flutter/material.dart';
import 'package:flutter_state_management_demo/models/todo_item.dart';

class TodoItemListTile extends StatelessWidget {
  const TodoItemListTile(
    this.todoItem, {
    required this.onRemove,
    required this.onUndo,
    required this.onChanged,
    super.key,
  });

  final TodoItem todoItem;
  final VoidCallback onRemove;
  final VoidCallback onUndo;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todoItem.isDone,
        onChanged: (_) {
          onChanged.call();
        },
      ),
      title: Text(todoItem.title),
      trailing: IconButton(
        onPressed: () {
          onRemove.call();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Deleted \'$todoItem\''),
              action: SnackBarAction(
                label: 'Undo',
                onPressed: onUndo,
              ),
            ),
          );
        },
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
