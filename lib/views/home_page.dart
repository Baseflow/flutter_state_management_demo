import 'package:flutter/material.dart';
import 'package:flutter_state_management_demo/models/todo_item.dart';
import 'package:flutter_state_management_demo/views/closed_todo_items_tab_view.dart';
import 'package:flutter_state_management_demo/views/open_todo_items_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TodoItem> _todoItems = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Open'),
              Tab(text: 'Done'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OpenTodoItemsTabView(_todoItems),
            ClosedTodoItemsTabView(_todoItems),
          ],
        ),
      ),
    );
  }
}
