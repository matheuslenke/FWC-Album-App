import 'package:flutter/material.dart';

import '../styles/button_styles.dart';
import '../styles/text_styles.dart';

class Button extends StatelessWidget {
  final ButtonStyle style;
  final TextStyle labelStyle;
  final String label;
  final double? width;
  final double? height;
  final VoidCallback onPressed;
  final bool outlined;

  const Button(
      {Key? key,
      required this.style,
      required this.labelStyle,
      required this.label,
      this.width,
      this.height,
      required this.onPressed,
      this.outlined = false})
      : super(key: key);

  Button.primary({
    Key? key,
    required this.label,
    this.width,
    this.height,
    required this.onPressed,
  })  : style = ButtonStyles.i.primaryButton,
        labelStyle = TextStyles.i.textSecondaryFontExtraBold,
        outlined = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final labelText =
        Text(label, style: labelStyle, overflow: TextOverflow.ellipsis);
    return SizedBox(
      width: width,
      height: height,
      child: outlined
          ? OutlinedButton(
              onPressed: onPressed,
              style: style,
              child: labelText,
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: style,
              child: labelText,
            ),
    );
  }
}
