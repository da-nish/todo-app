import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/auth_provider.dart';
import 'package:todoapp/ui/screens/home_screen/home_screen.dart';
import 'package:todoapp/ui/screens/login_screen/login_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Consumer<AuthProvider>(
        builder: (_, authProviderRef, __) {
          return authProviderRef.isLoggedIn
              ? HomeScreen(uid: authProviderRef.user!.id)
              : const LoginScreen(
                  title: 'Login',
                );
        },
      ),
    );
  }
}
