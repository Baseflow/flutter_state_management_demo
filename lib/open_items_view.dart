import 'package:flutter/material.dart';
import 'package:flutter_state_management_demo/to_do_item.dart';

class OpenItemsView extends StatefulWidget {
  const OpenItemsView({
    required List<ToDoItem> openItems,
    super.key,
  }) : _openItems = openItems;

  final List<ToDoItem> _openItems;

  @override
  _OpenItemsViewState createState() => _OpenItemsViewState();
}

class _OpenItemsViewState extends State<OpenItemsView> {
  final _textEditingController = TextEditingController();
  final _focusNode = FocusNode();

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
            setState(() {
              widget._openItems.add(ToDoItem(title: value));
              _textEditingController.clear();
              _focusNode.requestFocus();
            });
          },
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget._openItems.length,
            itemBuilder: (BuildContext context, int index) {
              final todo = widget._openItems[index];
              return ListTile(
                title: Text('${index + 1}. ${todo.title}'),
                leading: Checkbox(
                  value: todo.isDone,
                  onChanged: (value) {
                    setState(() {
                      todo.isDone = value ?? false;
                      widget._openItems.remove(todo);
                    });
                  },
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      widget._openItems.removeAt(index);
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
