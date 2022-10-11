import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/app_colors.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';

class ThemeConfig {
  ThemeConfig._();

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(18),
    borderSide: BorderSide(color: AppColors.i.greyDark, width: 1),
  );

  static final theme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: TextStyles.i.textPrimaryFontBold.copyWith(
        color: Colors.black,
        fontSize: 18,
      ),
    ),
    primaryColor: AppColors.i.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.i.primary,
      primary: AppColors.i.primary,
      secondary: AppColors.i.secondary,
    ),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        isDense: true,
        contentPadding: const EdgeInsets.all(13),
        border: _defaultInputBorder,
        enabledBorder: _defaultInputBorder,
        focusedBorder: _defaultInputBorder,
        labelStyle: TextStyles.i.labelTextField),
  );
}
