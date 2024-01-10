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
      child: BlocProvider(
        create: (context) => TodoCubit(),
        child: BlocBuilder<TodoCubit, TodoState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Home'),
                bottom: TabBar(
                  tabs: [
                    Tab(text: 'Open (${state.openTodoItems.length})'),
                    Tab(text: 'Done (${state.closedTodoItems.length})'),
                  ],
                ),
              ),
              body: const _TodoTabBarView(),
            );
          },
        ),
      ),
    );
  }
}

class _TodoTabBarView extends StatelessWidget {
  const _TodoTabBarView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoCubit, TodoState>(
      listenWhen: (previous, current) {
        return previous.todoItems.length > current.todoItems.length;
      },
      listener: (context, state) {
        _showSnackBar(context);
      },
      child: const TabBarView(
        children: [
          OpenTodoItemsTabView(),
          ClosedTodoItemsTabView(),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Deleted todo item'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: context.read<TodoCubit>().undoLastRemoved,
        ),
      ),
    );
  }
}
