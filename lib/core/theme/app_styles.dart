import 'package:flutter/material.dart';

mixin AppStyle {
  static BorderRadius pointedBorderRadius({double radius = 48}) {
    return BorderRadius.only(
      topRight: Radius.circular(radius),
      bottomLeft: Radius.circular(radius),
      topLeft: Radius.circular(radius),
      bottomRight: const Radius.circular(4),
    );
  }

  static BorderRadius circularBorder({double radius = 48}) {
    return BorderRadius.circular(radius);
  }
}
