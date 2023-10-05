import 'package:flutter/material.dart';
import 'package:flutter_state_management_demo/closed_items_view.dart';
import 'package:flutter_state_management_demo/open_items_view.dart';
import 'package:flutter_state_management_demo/to_do_item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

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
        body: SafeArea(
          child: TabBarView(
            children: [
              OpenItemsView(_todoItems),
              ClosedItemsView(_todoItems),
            ],
          ),
        ),
      ),
    );
  }
}
