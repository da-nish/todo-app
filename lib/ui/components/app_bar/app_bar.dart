import 'package:flutter/material.dart';
import 'package:todoapp/core/theme/theme.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final String title;

  const AppTopBar({super.key, this.title = 'sdfdf', this.actions = const []});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.transparent,
      leading: const SizedBox(),
      centerTitle: true,
      actions: [
        Container(
          // color: Theme.of(context).scaffoldBackgroundColor,
          padding: const EdgeInsets.symmetric(
              horizontal: Dimens.paddingXS, vertical: Dimens.paddingXS),
          width: MediaQuery.of(context).size.width,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back)),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  style: AppTextStyle.h4Regular(color: AppColors.white),
                ),
              ),
              Row(
                children: actions,
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
