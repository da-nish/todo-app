import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/auth_provider.dart';
import 'package:todoapp/services/firestore_database.dart';
import 'package:todoapp/ui/screens/home_screen.dart';
import 'package:todoapp/ui/screens/login_screen.dart';

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
      home: Consumer<AuthProvider>(
        builder: (_, authProviderRef, __) {
          // return authProviderRef.isLoggedIn
          //     ? const MyHomePage(
          //         title: "",
          //       )
          //     : const LoginScreen(
          //         title: 'Login',
          //       );
          return MyHomePage(title: "title");

          // return const Material(
          //   child: CircularProgressIndicator(),
          // );
        },
      ),
      // home: const LoginScreen(title: 'Flutter Demo Home Page'),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
