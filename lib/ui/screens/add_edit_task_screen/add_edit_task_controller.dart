import 'package:flutter/material.dart';
import 'package:todoapp/core/utils/date_extension.dart';
import 'package:todoapp/models/todo_model.dart';
import 'package:todoapp/services/firestore_database.dart';

class AddEditTaskController extends ChangeNotifier {
  TextEditingController dateInputController = TextEditingController();
  TextEditingController titleInputController = TextEditingController();
  TextEditingController descriptionInputController = TextEditingController();
  final bool isEditFlow;
  final TodoModel? data;

  AddEditTaskController({this.isEditFlow = false, required this.data}) {
    date = data?.date;
    titleInputController.text = data?.title ?? "";
    descriptionInputController.text = data?.description ?? "";
    notifyListeners();
  }

  String get title => titleInputController.text;
  String get description => descriptionInputController.text;

  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? value) {
    _date = value;
    if (value != null) {
      dateInputController.text = value.dateFormat();
    } else {
      dateInputController.text = "";
    }
    notifyListeners();
  }

  String? dateValidator(String? value) {
    if ((value ?? "").isEmpty) {
      return 'Please choose date';
    }
    return null;
  }

  String? titleValidator(String? value) {
    if ((value ?? "").isEmpty) {
      return 'Please enter title';
    } else if (titleInputController.text.length <= 2) {
      return 'invalid title';
    }
    return null;
  }

  String? descriptionValidator(String? value) {
    if ((value ?? "").isEmpty) {
      return 'Please enter your description';
    } else if (descriptionInputController.text.length <= 2) {
      return 'invalid description';
    }

    return null;
  }

  Future<void> saveForm(BuildContext context, GlobalKey<FormState> form) async {
    final isvalid = form.currentState!.validate();
    if (isvalid == false) {
      return;
    }

    FirestoreDatabase firestoreDatabase = FirestoreDatabase.instance;
    TodoModel taskInfo = TodoModel(
        id: data?.id ?? DateTime.now().microsecondsSinceEpoch.toString(),
        title: title,
        description: description,
        date: date!,
        complete: false);

    form.currentState?.save();

    await firestoreDatabase.setTodo(taskInfo).then((value) {
      Navigator.of(context).pop();
    });
  }
}
