import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_demo/closed_items_view.dart';
import 'package:flutter_state_management_demo/cubit/todo_cubit.dart';
import 'package:flutter_state_management_demo/open_items_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: DefaultTabController(
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
          body: const SafeArea(
            child: _TodoTabBarView(),
          ),
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
        return current.todoItems.length < previous.todoItems.length;
      },
      listener: (context, state) {
        _showUndoSnackbar(context);
      },
      child: const TabBarView(
        children: [
          OpenItemsView(),
          ClosedItemsView(),
        ],
      ),
    );
  }

  void _showUndoSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Todo item removed'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: context.read<TodoCubit>().undoRemovedItem,
        ),
      ),
    );
  }
}
