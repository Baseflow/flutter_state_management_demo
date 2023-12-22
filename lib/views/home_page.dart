import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_demo/cubit/todo_cubit.dart';
import 'package:flutter_state_management_demo/views/closed_todo_items_tab_view.dart';
import 'package:flutter_state_management_demo/views/open_todo_items_tab_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        body: BlocProvider<TodoCubit>(
          create: (context) => TodoCubit(),
          child: const TabBarView(
            children: [
              OpenTodoItemsTabView(),
              ClosedTodoItemsTabView(),
            ],
          ),
        ),
      ),
    );
  }
}
