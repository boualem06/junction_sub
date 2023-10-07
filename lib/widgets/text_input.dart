import 'package:flutter/material.dart';

import 'package:sh7i7a/colors.dart';

class DinarInput extends TextFormField {
  final String hintText;
  final InputDecoration decorations;
  final double? letterSpacing;
  final Color? textColor;
  final double textSize;
  DinarInput({
    Key? key,
    this.textSize = 17,
    required this.hintText,
    super.validator,
    this.letterSpacing,
    this.textColor = blue,
    super.controller,
    super.focusNode,
    super.keyboardType,
    this.decorations = const InputDecoration(
      errorText: null,
      filled: true,
      fillColor: white,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.5,
          color: blue,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: blue,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      hintStyle: TextStyle(
        color: grey,
        fontSize: 15.0,
        letterSpacing: 1,
      ),
      hintTextDirection: TextDirection.ltr,
      contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
    ),
    super.textInputAction,
    super.textCapitalization = TextCapitalization.words,
    super.strutStyle,
    super.textAlign = TextAlign.start,
    super.textAlignVertical,
    super.textDirection = TextDirection.ltr,
    super.readOnly = false,
    super.showCursor = true,
    super.autofocus = false,
    super.autovalidateMode,
    super.obscuringCharacter = '•',
    super.obscureText = false,
    super.autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    super.enableSuggestions = true,
    super.maxLines = 1,
    super.minLines,
    super.expands = false,
    super.maxLength,
    super.maxLengthEnforcement,
    super.onChanged,
    super.onEditingComplete,
    super.inputFormatters,
    super.enabled,
    super.cursorWidth = 2.0,
    super.cursorHeight,
    super.cursorRadius = const Radius.circular(1.0),
    super.cursorColor = blue,
    super.keyboardAppearance,
    super.scrollPadding = const EdgeInsets.all(20.0),
    bool? enableInteractiveSelection,
    super.selectionControls,
    super.onTap,
    super.mouseCursor,
    super.buildCounter,
    super.scrollController,
    super.scrollPhysics,
    super.autofillHints = const <String>[],
    super.restorationId,
    super.enableIMEPersonalizedLearning = true,
  }) : super(
          key: key,
          decoration: decorations.copyWith(
            hintText: hintText,
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: blue), // Set error color
              borderRadius: BorderRadius.circular(50.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: blue), // Set error color
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          style: TextStyle(
            color: textColor,
            fontSize: textSize,
            letterSpacing: letterSpacing ?? 1,
          ),
        );
}
