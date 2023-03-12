import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/core/theme/app_colors.dart';
import 'package:todoapp/core/theme/app_text_style.dart';
import 'package:todoapp/core/values/app_assets.dart';
import 'package:todoapp/providers/auth_provider.dart';
import 'package:todoapp/ui/components/raised_button/app_button.dart';
import 'package:todoapp/ui/components/raised_button/app_button_style.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppButton(
                AppButtonStyle.fromTheme(Theme.of(context),
                    activeColor: AppColors.darkBlue),
                () {
                  final authProvider =
                      Provider.of<AuthProvider>(context, listen: false);

                  authProvider.googleLogin();
                },
                Text(
                  "Login with Google",
                  style: AppTextStyle.h4Regular(color: AppColors.white),
                ),
                svgIcon: AppAssets.googleIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
