import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dinar/colors.dart';
import 'package:dinar/utils.dart';

class DinarButton extends TextButton {
  final double height, width;
  final Color color;
  final Color? btnTextColor;
  final bool? disabled; // Updated to be an optional boolean

  DinarButton({
    Key? key,
    required VoidCallback? onPressed,
    this.height = 40.0,
    this.width = double.infinity,
    this.color = blue,
    this.btnTextColor = white,
    this.disabled, // Updated to be an optional boolean
    VoidCallback? onLongPress,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    LinearGradient? gradient,
    String? label,
    String icon = '',
    Widget? son,
    FontWeight? fontW,
  }) : super(
          key: key,
          onPressed: disabled == true
              ? null
              : onPressed, // Disable the button when 'disabled' is true
          onLongPress: onLongPress,
          onHover: null,
          onFocusChange: onFocusChange,
          style: style ?? const ButtonStyle(), // Empty style as we set it below
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          child: son ??
              Container(
                height: height,
                width: width,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  color: disabled == true
                      ? Colors.grey
                      : color, // Adjust color based on 'disabled' property
                  gradient: gradient,
                ),
                child: Row(
                  children: [
                    icon != ''
                        ? SvgPicture.asset(getIcon(icon))
                        : const Spacer(),
                    if (icon != '') const SizedBox(width: 6),
                    Text(
                      label!,
                      style: TextStyle(
                        color: btnTextColor,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
        );
}
