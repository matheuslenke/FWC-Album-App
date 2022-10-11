import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/app_colors.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';

class ButtonStyles {
  static ButtonStyles? _instance;

  ButtonStyles._(); // Construtor privado

  static ButtonStyles get i {
    _instance ??= ButtonStyles._();
    return _instance!;
  }

  ButtonStyle get yellowButton => ElevatedButton.styleFrom(
      backgroundColor: AppColors.i.yellow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      textStyle: TextStyles.i.textSecondaryFontExtraBold.copyWith(
        fontSize: 14,
      ));

  ButtonStyle get yellowOutlinedButton => OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      side: BorderSide(
        color: AppColors.i.yellow,
      ),
      textStyle: TextStyles.i.textSecondaryFontExtraBold.copyWith(
        fontSize: 14,
      ));

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
      backgroundColor: AppColors.i.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      textStyle: TextStyles.i.textSecondaryFontExtraBold.copyWith(
        fontSize: 14,
      ));

  ButtonStyle get primaryOutlinedButton => OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      textStyle: TextStyles.i.textSecondaryFontExtraBold.copyWith(
        fontSize: 14,
      ));
}

extension ButtonStyleExtensions on BuildContext {
  ButtonStyles get buttonStyles => ButtonStyles.i;
}
