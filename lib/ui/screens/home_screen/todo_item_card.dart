import 'package:flutter/material.dart';
import 'package:todoapp/core/theme/theme.dart';
import 'package:todoapp/core/utils/date_extension.dart';
import 'package:todoapp/models/todo_model.dart';
import 'package:todoapp/services/firestore_database.dart';
import 'package:todoapp/ui/screens/add_edit_task_screen/add_edit_task_screen.dart';

class TodoItemCard extends StatelessWidget {
  final TodoModel item;
  const TodoItemCard({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showBottomSheet(context),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    // backgroundImage: AssetImage('assets/appdev.png'),
                    radius: 29,
                    child: Icon(
                      Icons.circle,
                      color: AppColors.grey,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.date.dateFormatDDMM(),
                      style: AppTextStyle.h6Regular(),
                    ),
                    const SizedBox(height: 4),
                    const Icon(
                      Icons.circle,
                      size: 16,
                      color: AppColors.greyInactive,
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

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
        // context and builder are
        // required properties in this widget
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimens.grid10),
            topRight: Radius.circular(Dimens.grid10),
          ),
        ),
        builder: (BuildContext context) {
          // we set up a container inside which
          // we create center column and display text

          // Returning SizedBox instead of a Container
          return SizedBox(
            height: 220,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: AppTextStyle.h3Bold(),
                  ),
                  const Divider(),
                  Text(
                    item.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: AppTextStyle.h5Regular(),
                  ),
                  const Divider(),
                  Text(
                    "Date: ${item.date.dateFormat()}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop();
                          FirestoreDatabase.instance.deleteTodo(item);
                        },
                        icon: const Icon(Icons.delete_forever_rounded),
                        label: const Text("Delete"),
                      ),
                      const SizedBox(width: Dimens.grid8),
                      OutlinedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddEditTask(
                                    isEditFlow: true,
                                    data: item,
                                  )));
                        },
                        icon: const Icon(Icons.edit),
                        label: const Text("Edit"),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
