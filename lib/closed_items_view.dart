import 'package:flutter/material.dart';
import 'package:flutter_state_management_demo/to_do_item.dart';

class ClosedItemsView extends StatefulWidget {
  const ClosedItemsView({
    required List<ToDoItem> closedItems,
    super.key,
  }) : _closedItems = closedItems;

  final List<ToDoItem> _closedItems;

  @override
  _ClosedItemsViewState createState() => _ClosedItemsViewState();
}

class _ClosedItemsViewState extends State<ClosedItemsView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget._closedItems.length,
      itemBuilder: (BuildContext context, int index) {
        final todo = widget._closedItems[index];
        return ListTile(
          title: Text('${index + 1}. ${todo.title}'),
          leading: Checkbox(
            value: todo.isDone,
            onChanged: (value) {
              setState(() {
                todo.isDone = value ?? false;
              });
            },
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              setState(() {
                widget._closedItems.removeAt(index);
              });
            },
          ),
        );
      },
    );
  }
}
