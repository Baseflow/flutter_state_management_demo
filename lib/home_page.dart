import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key})
      : _todoItems = [
          'Item 1',
          'Item 2',
          'Item 3',
        ];

  final List<String> _todoItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
        itemCount: _todoItems.length,
        itemBuilder: (BuildContext context, int index) {
          final todo = _todoItems[index];
          return ListTile(
            title: Text(todo),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _todoItems.add('Item ${_todoItems.length + 1}');
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
