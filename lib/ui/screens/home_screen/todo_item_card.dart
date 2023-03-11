import 'package:flutter/material.dart';
import 'package:todoapp/ui/screens/add_edit_task_screen/add_edit_task_screen.dart';

class TodoItemCard extends StatelessWidget {
  const TodoItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const AddEditTask(
                    isEditFlow: true,
                    data: "",
                  )),
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.teal,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    // backgroundImage: AssetImage('assets/appdev.png'),
                    radius: 28,
                    child: Icon(Icons.abc),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Title"),
                      SizedBox(height: 10),
                      Text("Title"),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
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
          const Divider()
        ],
      ),
    );
  }
}
