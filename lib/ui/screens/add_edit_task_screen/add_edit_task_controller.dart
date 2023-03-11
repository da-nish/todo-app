import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/todo_model.dart';
import 'package:todoapp/services/firestore_database.dart';

class AddEditTaskController extends ChangeNotifier {
  TextEditingController dateInputController = TextEditingController();
  TextEditingController titleInputController = TextEditingController();
  TextEditingController descriptionInputController = TextEditingController();
  final bool isEditFlow;
  final String? data;

  AddEditTaskController({this.isEditFlow = false, required this.data});

  String get title => titleInputController.text;
  String get description => descriptionInputController.text;

  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? value) {
    _date = value;
    if (value != null) {
      dateInputController.text = DateFormat('yyyy-MM-dd').format(value);
    } else {
      dateInputController.text = "";
    }
    notifyListeners();
  }

  void redirectToHome() {}

  // ===================FORM VALIDATION METHODS========================

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
    return null; //means no error
  }

  String? descriptionValidator(String? value) {
    if ((value ?? "").isEmpty) {
      return 'Please enter your description';
    } else if (descriptionInputController.text.length <= 2) {
      return 'invalid description';
    }

    return null; //means no error
  }

  void saveForm(BuildContext context, GlobalKey<FormState> _form) {
    // print(controller.userInfo.toString());
    // final isvalid = _form.currentState!.validate();
    // if (isvalid == false) {
    //   return;
    // }

    FirestoreDatabase firestoreDatabase = Provider.of(context);
    firestoreDatabase.setTodo(TodoModel(
        id: 'id', task: 'task', extraNote: 'extraNote', complete: false));

    _form.currentState?.save();
  }
}
