import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/core/theme/theme.dart';
import 'package:todoapp/providers/auth_provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Widget _getCard(String text, IconData icon,
      {ontap, bool hideDivider = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimens.paddingS, vertical: Dimens.paddingXS),
      child: InkWell(
        onTap: () {
          ontap();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon),
                const SizedBox(width: Dimens.grid8),
                Text(text),
              ],
            ),
            if (!hideDivider)
              const Divider(
                color: AppColors.grey,
              )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: Dimens.grid16),
              const SizedBox(height: Dimens.grid16),
              _getCard('Logout', Icons.logout, hideDivider: true,
                  ontap: () async {
                final authProvider =
                    Provider.of<AuthProvider>(context, listen: false);

                await authProvider.googleLogout();
                Navigator.of(context).pop();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
