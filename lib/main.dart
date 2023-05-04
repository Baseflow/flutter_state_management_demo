import 'package:flutter/material.dart';
import 'package:flutter_state_management_demo/closed_items_view.dart';
import 'package:flutter_state_management_demo/open_items_view.dart';
import 'package:flutter_state_management_demo/to_do_item.dart';

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
  List<ToDoItem> _todoItems = [];

  @override
  Widget build(BuildContext context) {
    final openItems = _todoItems.where((todo) => !todo.isDone).toList();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Todo List'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Open'),
                Tab(text: 'Done'),
              ],
            )),
        body: TabBarView(
          children: [
            OpenItemsView(
              openItems: _todoItems
                  .where(
                    (element) => !element.isDone,
                  )
                  .toList(),
            ),
            ClosedItemsView(
              closedItems: _todoItems
                  .where(
                    (element) => element.isDone,
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
