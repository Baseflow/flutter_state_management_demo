import 'package:flutter/material.dart';
import 'package:flutter_state_management_demo/to_do_item.dart';

class ClosedItemsView extends StatefulWidget {
  const ClosedItemsView(
    this.todoItems, {
    super.key,
  });

  final List<TodoItem> todoItems;

  @override
  State<ClosedItemsView> createState() => _ClosedItemsViewState();
}

class _ClosedItemsViewState extends State<ClosedItemsView> {
  @override
  Widget build(BuildContext context) {
    final closedItems = widget.todoItems.where((todo) => todo.isDone).toList();
    return ListView.builder(
      itemCount: closedItems.length,
      itemBuilder: (BuildContext context, int index) {
        final todo = widget.todoItems[index];
        if (!todo.isDone) {
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
                closedItems.removeAt(index);
              });
            },
          ),
        );
      },
    );
  }
}
