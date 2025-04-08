import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipeable List Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SwipeableList(),
    );
  }
}

class SwipeableList extends StatelessWidget {
  const SwipeableList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swipe to Edit/Delete'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: 20, // Number of list items
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(index.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              // You can add your delete logic here
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Item $index deleted')));
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.blue,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.edit, color: Colors.white),
            ),
            child: ListTile(
              title: Text('Item $index'),
              subtitle: const Text('Swipe left to delete, right to edit'),
              tileColor: Colors.teal.shade50,
            ),
          );
        },
      ),
    );
  }
}
