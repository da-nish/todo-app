import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/core/theme/app_colors.dart';
import 'package:todoapp/core/theme/app_text_style.dart';
import 'package:todoapp/ui/components/app_drawer/app_drawer.dart';
import 'package:todoapp/ui/screens/add_edit_task_screen/add_edit_task_screen.dart';
import 'package:todoapp/ui/screens/header_card.dart';
import 'package:todoapp/ui/screens/home_screen/home_controller.dart';
import 'package:todoapp/ui/screens/home_screen/todo_item_card.dart';

class HomeScreen extends StatelessWidget {
  final String uid;
  const HomeScreen({required this.uid, super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeController>(
      create: (context) => HomeController(),
      child: const _HomeScreen(),
    );
    // return const _HomeScreen();
  }
}

class _HomeScreen extends StatefulWidget {
  const _HomeScreen();

  @override
  State<_HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen> {
  HomeController? homeController;
  @override
  void initState() {
    super.initState();
    // homeController = Provider.of<HomeController>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(builder: (context, homeController, child) {
      return Scaffold(
        drawer: const AppDrawer(),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              const SizedBox(width: double.infinity, child: HomeHeaderCard()),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Inbox',
                      style: AppTextStyle.h4Medium(color: AppColors.grey),
                    ),
                    ...List.generate(homeController.todoItems.length, (index) {
                      return TodoItemCard(
                          item: homeController.todoItems[index]);
                    }),
                    Row(
                      children: [
                        Text(
                          'Completed',
                          style: AppTextStyle.h4Medium(color: AppColors.grey),
                        ),
                        const SizedBox(width: 8),
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 10,
                          child: Text(
                            '5',
                            style: AppTextStyle.h6Medium(color: AppColors.grey),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
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
    });
  }
}
