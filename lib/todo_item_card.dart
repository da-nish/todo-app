import 'package:flutter/material.dart';
import 'package:todoapp/add_edit_task/edit_task_screen.dart';

class TodoItemCard extends StatelessWidget {
  const TodoItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddEditTask()),
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.teal,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.abc),
                    // backgroundImage: AssetImage('assets/appdev.png'),
                    radius: 28,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Title"),
                      SizedBox(height: 10),
                      Text("Title"),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("9 oct"),
                    SizedBox(height: 4),
                    Icon(
                      Icons.circle,
                      size: 16,
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
