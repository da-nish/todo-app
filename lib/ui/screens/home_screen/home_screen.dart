import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/application.dart';
import 'package:todoapp/services/firestore_database.dart';
import 'package:todoapp/ui/components/app_drawer/app_drawer.dart';
import 'package:todoapp/ui/screens/add_edit_task_screen/add_edit_task_screen.dart';
import 'package:todoapp/ui/screens/header_card.dart';
import 'package:todoapp/ui/screens/home_screen/todo_item_card.dart';

class HomeScreen extends StatelessWidget {
  final String uid;
  const HomeScreen({required this.uid, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<FirestoreDatabase>(
        create: (context) => FirestoreDatabase(uid: uid),
      ),
    ], builder: (context, child) => const _HomeScreen());
  }
}

class _HomeScreen extends StatefulWidget {
  const _HomeScreen();

  @override
  State<_HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen> {
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const AddEditTask(isEditFlow: false)),
          );
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
