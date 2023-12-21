import 'package:flutter/material.dart';
import 'package:flutter_state_management_demo/todo_item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key})
      : _controller = TextEditingController(),
        _todoItems = const [];

  final List<TodoItem> _todoItems;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Enter a new todo item',
              contentPadding: EdgeInsets.all(16),
            ),
            onSubmitted: (value) {
              // TODO: Add the value to the list of items;
              _controller.clear();
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todoItems.length,
              itemBuilder: (BuildContext context, int index) {
                final todo = _todoItems[index];
                return ListTile(
                  title: Text(todo.title),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
