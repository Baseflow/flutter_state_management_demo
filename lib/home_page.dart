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
            child: TabBarView(
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
}
