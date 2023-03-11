import 'package:flutter/material.dart';
import 'package:todoapp/ui/components/app_drawer/app_drawer.dart';
import 'package:todoapp/ui/screens/header_card.dart';
import 'package:todoapp/ui/screens/todo_item_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const SizedBox(width: double.infinity, child: HomeHeaderCard()),
            Text(
              'Indbox',
              style: Theme.of(context).textTheme.headline5,
            ),
            ...List.generate(6, (index) {
              return const TodoItemCard();
            }),
            Row(
              children: [
                Text(
                  'Completed',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(width: 10),
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 10,
                  child: Text("5"),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
