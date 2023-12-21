import 'package:flutter/material.dart';
import 'package:flutter_state_management_demo/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TodoItem> _todoItems = [];
  final TextEditingController _controller = TextEditingController();
  final _focusNode = FocusNode();

  TodoItem? _lastRemovedItem;

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
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
                _todoItems.add(TodoItem(title: value));
              });
              _controller.clear();
              _focusNode.requestFocus();
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todoItems.length,
              itemBuilder: (BuildContext context, int index) {
                final todo = _todoItems[index];
                return ListTile(
                  title: Text(todo.title),
                  // TODO: Add something here to delete the item.
                  // TODO(bonus): Add something here to undo the deleted item.
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
