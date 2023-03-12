import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/todo_model.dart';
import 'package:todoapp/ui/components/app_bar/app_bar.dart';
import 'package:todoapp/core/theme/theme.dart';
import 'package:todoapp/ui/components/raised_button/app_button.dart';
import 'package:todoapp/ui/components/raised_button/app_button_style.dart';
import 'package:todoapp/ui/screens/add_edit_task_screen/add_edit_task_controller.dart';

class AddEditTask extends StatelessWidget {
  final TodoModel? data;
  final bool isEditFlow;
  const AddEditTask({this.isEditFlow = false, this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(
        title: "${isEditFlow ? 'Edit' : 'Add'} Item",
      ),
      backgroundColor: AppColors.darkBlue,
      body: ChangeNotifierProvider(
        create: (context) =>
            AddEditTaskController(isEditFlow: isEditFlow, data: data),
        builder: (context, child) => _AddEditTask(),
        // child: _AddEditTask(),
      ),
    );
  }
}

class _AddEditTask extends StatefulWidget {
  @override
  State<_AddEditTask> createState() => _AddEditTaskState();
}

class _AddEditTaskState extends State<_AddEditTask> {
  final _form = GlobalKey<FormState>();
  final focusTitle = FocusNode();
  final focusDescription = FocusNode();
  final focusDate = FocusNode();
  final focusExit = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Consumer<AddEditTaskController>(
        builder: (context, controller, child) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.grid16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _form,
              child: Column(children: <Widget>[
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(focusDescription);
                    },
                    initialValue: controller.title,
                    textDirection: TextDirection.ltr,
                    style: AppTextStyle.h4Regular(color: AppColors.grey2),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: controller.titleValidator,
                    onChanged: (value) {
                      controller.titleInputController.text = value;
                    }),
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Description',
                    ),
                    initialValue: controller.description,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    style: AppTextStyle.h4Regular(color: AppColors.grey2),
                    focusNode: focusDescription,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(focusDate);
                    },
                    validator: controller.descriptionValidator,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textDirection: TextDirection.ltr,
                    onChanged: (value) {
                      controller.descriptionInputController.text = value;
                    }),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Enter Date"),
                  onChanged: (value) {
                    controller.dateInputController.text = value;
                  },
                  controller: controller.dateInputController,
                  readOnly: true,
                  validator: controller.dateValidator,
                  focusNode: focusDate,
                  style: AppTextStyle.h4Regular(color: AppColors.grey2),
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(focusExit);
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onTap: () async {
                    DateTime pickedDate =
                        await _selectDate(context, controller.date);
                    controller.date = (pickedDate);
                    setState(() {});
                  },
                )
              ]),
            ),
            const SizedBox(height: Dimens.grid20),
            const SizedBox(height: Dimens.grid20),
            AppButton(
              AppButtonStyle.fromTheme(Theme.of(context),
                  activeColor: AppColors.activeBlue),
              () {
                controller.saveForm(context, _form);
              },
              Text(
                controller.isEditFlow ? "Update" : "Add",
                style: AppTextStyle.h4Regular(color: AppColors.white),
              ),
              // svgIcon: AppAssets.googleIcon,
            ),
            const SizedBox(height: Dimens.grid20),
            const SizedBox(height: Dimens.grid20),
            const Text("")
          ],
        ),
      );
    });
  }

  Future<DateTime> _selectDate(
      BuildContext context, DateTime? selectedDate) async {
    DateTime now = DateTime.now();
    selectedDate ??= now;
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate:
            DateTime(selectedDate.year, selectedDate.month, selectedDate.day),
        lastDate: DateTime(now.year + 1, now.month, now.day),
        firstDate: now);
    return picked ?? now;
  }
}
