import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  Widget child;
  Function onPressed;
  SocialButton({required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
          alignment: Alignment.center,
          // height: 43.h,
          // width: Get.width,
          decoration: BoxDecoration(
              border:
                  Border.all(color: const Color(0xff325DF9).withOpacity(0.21)),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white),
          child: child),
    );
  }
}
