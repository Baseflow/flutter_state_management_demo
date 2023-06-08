import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_demo/closed_items_view.dart';
import 'package:flutter_state_management_demo/cubit/todo_cubit.dart';
import 'package:flutter_state_management_demo/open_items_view.dart';

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
  @override
  Widget build(BuildContext context) {
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
        body: BlocProvider(
          create: (context) => TodoCubit(),
          child: BlocListener<TodoCubit, TodoState>(
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
          ),
        ),
      ),
    );
  }

  void _showUndoSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Todo item removed'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            context.read<TodoCubit>().undoRemoveItem();
          },
        ),
      ),
    );
  }
}
