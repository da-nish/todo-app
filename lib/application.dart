import 'package:flutter/material.dart';
import 'package:todoapp/login_screen.dart';
import 'package:todoapp/services/firestore_database.dart';

class Application extends StatelessWidget {
  final FirestoreDatabase Function(BuildContext context, String uid)
      databaseBuilder;

  const Application({required Key key, required this.databaseBuilder})
      : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(title: 'Flutter Demo Home Page'),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
