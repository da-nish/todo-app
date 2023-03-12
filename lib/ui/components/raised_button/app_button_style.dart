import 'package:flutter/material.dart';
import 'package:todoapp/core/theme/theme.dart';

class AppButtonStyle {
  final double height;
  final Color activeColor;
  final Color inactiveColor;
  final Color borderColor;
  final double inactiveChildOpacity;
  final double shadowOpacity;
  final double borderRadius;

  final Duration animationDuration;

  AppButtonStyle.fromTheme(ThemeData theme,
      {this.height = Dimens.raisedButtonHeight,
      this.shadowOpacity = Dimens.opacityL,
      this.inactiveChildOpacity = Dimens.opacityM,
      this.animationDuration = Dimens.durationM,
      this.borderRadius = Dimens.buttonCornerRadius,
      this.activeColor = AppColors.darkBlue})
      : borderColor = theme.highlightColor,
        inactiveColor = AppColors.grey;

  AppButtonStyle.fromThemeBorder(ThemeData theme,
      {this.height = Dimens.raisedButtonHeight,
      this.shadowOpacity = Dimens.opacityL,
      this.inactiveChildOpacity = Dimens.opacityM,
      this.animationDuration = Dimens.durationM,
      this.borderRadius = Dimens.buttonCornerRadius})
      : activeColor = AppColors.transparent,
        borderColor = AppColors.grey2,
        inactiveColor = AppColors.grey;
}
