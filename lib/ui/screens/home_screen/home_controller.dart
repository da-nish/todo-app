import 'package:flutter/material.dart';
import 'package:todoapp/models/todo_model.dart';
import 'package:todoapp/services/firestore_database.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
    Stream<List<TodoModel>> todoStream =
        FirestoreDatabase.instance.todosStream();
    todoStream.listen((event) {
      todoItems = event;
      notifyListeners();
    });
  }

  List<TodoModel> todoItems = [];
}
