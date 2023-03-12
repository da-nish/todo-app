import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todoapp/core/theme/theme.dart';
import 'package:todoapp/ui/components/raised_button/app_button_style.dart';

class AppButton extends StatefulWidget {
  final AppButtonStyle style;
  final Function onPressed;
  final Widget child;
  final bool enabled;
  final String svgIcon;

  const AppButton(this.style, this.onPressed, this.child,
      {super.key, this.enabled = true, this.svgIcon = ""});

  @override
  State createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  ColorTween? _colorTween;
  late Animation<double> _colorCurve;

  Color get _animatedColor =>
      _colorTween?.evaluate(_colorCurve) ??
      (widget.enabled ? widget.style.activeColor : widget.style.inactiveColor);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: widget.style.animationDuration, vsync: this);
    _colorCurve = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInOut,
    );
  }

  @override
  void didUpdateWidget(AppButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.enabled != oldWidget.enabled) {
      _colorTween = ColorTween(
          begin: oldWidget.enabled
              ? widget.style.activeColor
              : widget.style.inactiveColor,
          end: oldWidget.enabled
              ? widget.style.inactiveColor
              : widget.style.activeColor);

      _animationController!
        ..value = 0
        ..forward();
    }

    if (oldWidget.child != widget.child) setState(() {});
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) => Container(
            height: widget.style.height,
            decoration: BoxDecoration(
              border: Border.all(
                  color: widget.enabled
                      ? widget.style.borderColor
                      : widget.style.inactiveColor),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: _animatedColor,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: TextButton(
                  onPressed: widget.enabled
                      ? widget.onPressed as void Function()?
                      : null,
                  child: Opacity(
                    opacity:
                        widget.enabled ? 1 : widget.style.inactiveChildOpacity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        widget.child,
                        if (widget.svgIcon.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(left: Dimens.grid8),
                            child: SvgPicture.asset(widget.svgIcon,
                                height: Dimens.grid20, width: Dimens.grid20),
                          ),
                      ],
                    ),
                  )),
            ),
          ));

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }
}
