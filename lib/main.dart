import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<String> _todoItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: ListView.builder(
            itemCount: _todoItems.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text(_todoItems[index]),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _addTodoItem),
    );
  }

  void _addTodoItem() {
    _todoItems.add('Placeholder');
  }
}
