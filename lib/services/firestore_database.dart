import 'dart:async';
import 'package:todoapp/models/todo_model.dart';
import 'package:todoapp/services/firestore_path.dart';
import 'package:todoapp/services/firestore_service.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase {
  static FirestoreDatabase? _instance;
  static FirestoreDatabase get instance => _instance!;

  static createInstance(String id) {
    _instance ??= FirestoreDatabase._(uid: id);
    return _instance;
  }

  FirestoreDatabase._({required this.uid});
  final String uid;
  final _firestoreService = FirestoreService.instance;

  //Method to create/update todoModel
  Future<void> setTodo(TodoModel todo) async {
    await _firestoreService.set(
      path: FirestorePath.userTodo(uid, todo.id),
      data: todo.toMap(),
    );
  }

  //Method to delete todoModel entry
  Future<void> deleteTodo(TodoModel todo) async {
    await _firestoreService.deleteData(
        path: FirestorePath.userTodo(uid, todo.id));
  }

  //Method to retrieve all todos item from the same user based on uid
  Stream<List<TodoModel>> todosStream() => _firestoreService.collectionStream(
        path: FirestorePath.todos(uid),
        builder: (data, documentId) => TodoModel.fromMap(data, documentId),
      );
}
