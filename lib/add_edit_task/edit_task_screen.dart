import 'package:flutter/material.dart';
import 'package:todoapp/ui/components/app_bar/app_bar.dart';
import 'package:todoapp/core/theme/theme.dart';

class AddEditTask extends StatelessWidget {
  const AddEditTask({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppTopBar(
        title: "Add Item",
      ),
      backgroundColor: AppColors.blueShade,
    );
  }
}
