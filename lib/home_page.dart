import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _todoItems = [];
  final _textEditingController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              textInputAction: TextInputAction.done,
              controller: _textEditingController,
              focusNode: _focusNode,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                hintText: 'Enter a todo item',
              ),
              onSubmitted: (value) {
                setState(() {
                  _todoItems.add(value);
                });
                _textEditingController.clear();
                _focusNode.requestFocus();
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _todoItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final todo = _todoItems[index];
                  return ListTile(
                    title: Text(todo),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          _todoItems.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
