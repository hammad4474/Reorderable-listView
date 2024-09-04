import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<int> items = List<int>.generate(30, (int index) => index);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SafeArea(
        child: Scaffold(
          body: ReorderableListView(
              children: List.generate(
                  items.length,
                  (index) => ListTile(
                        key: Key('$index'),
                        tileColor: items[index].isOdd
                            ? Colors.white12
                            : Colors.white30,
                        title: Text('Item ${items[index]}'),
                        trailing: const Icon(Icons.drag_handle_sharp),
                      )),
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final int item = items.removeAt(oldIndex);
                  items.insert(newIndex, item);
                });
              }),
        ),
      ),
    );
  }
}
