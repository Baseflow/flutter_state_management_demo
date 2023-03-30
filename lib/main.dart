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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _todoItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _todoItems.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text('${index + 1}. ${_todoItems[index]}'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodoItem,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addTodoItem() {
    setState(() {
      _todoItems.add('Placeholder');
    });
  }
}
