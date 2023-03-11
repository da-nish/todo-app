import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/auth_provider.dart';
import 'package:todoapp/ui/components/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SocialButton(
              onPressed: () async {
                final authProvider =
                    Provider.of<AuthProvider>(context, listen: false);

                authProvider.googleLogin();
              },
              child: Row(
                children: [
                  const SizedBox(width: 24),
                  Image.asset(
                    "assets/images/goggle_icon.png",
                    height: 22,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}