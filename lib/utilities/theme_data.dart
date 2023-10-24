import 'package:flutter/material.dart';

class ThemeColors {
  final Color
    primary,
    onPrimary,
    secondary,
    onSecondary,
    primaryButton,
    onBackground,
    surface,
    infoLighter,
    infoLight,
    infoMain,
    infoDark,
    infoDarker,
    successLighter,
    successLight,
    successMain,
    successDark,
    successDarker,
    warningLighter,
    warningLight,
    warningMain,
    warningDark,
    warningDarker,
    errorLighter,
    errorLight,
    errorMain,
    errorDark,
    errorDarker,
    fillBgBlack,
    fillBgWhite,
    fillBgGrey1,
    fillBgGrey2,
    fillBgGrey3;

  ThemeColors({
    this.primary = const Color(0xFF993D99),
    this.onPrimary = const Color(0xFFFFFFFF),
    this.secondary = const Color(0xFF9043FF),
    this.onSecondary = const Color(0xFFFFFFFF),
    this.primaryButton = const Color(0xFF993D99),
    this.onBackground = const Color(0xFF000000),
    this.surface = const Color(0xFFE2F4FF),
    this.infoLighter = const Color(0xFFC1E5FF),
    this.infoLight = const Color(0xFF69BFFE),
    this.infoMain = const Color(0xFF20A1FF),
    this.infoDark = const Color(0xFF1A7EC8),
    this.infoDarker = const Color(0xFF0D446C),
    this.successLighter = const Color(0xFFD8F5C3),
    this.successLight = const Color(0xFF89DA6D),
    this.successMain = const Color(0xFF65D83C),
    this.successDark = const Color(0xFF4A9D2D),
    this.successDarker = const Color(0xFF336B1F),
    this.warningLighter = const Color(0xFFFCEDC7),
    this.warningLight = const Color(0xFFFFD568),
    this.warningMain = const Color(0xFFFFC225),
    this.warningDark = const Color(0xFFCC9D24),
    this.warningDarker = const Color(0xFF8A6A16),
    this.errorLighter = const Color(0xFFFFE5E5),
    this.errorLight = const Color(0xFFFF8484),
    this.errorMain = const Color(0xFFFF4242),
    this.errorDark = const Color(0xFFC92F2F),
    this.errorDarker = const Color(0xFF802222),
    this.fillBgBlack = const Color(0xFF000000),
    this.fillBgWhite = const Color(0xFFFFFFFF),
    this.fillBgGrey1 = const Color(0xFFE4E4E4),
    this.fillBgGrey2 = const Color(0xFFF8F7F7),
    this.fillBgGrey3 = const Color(0xFFF7F7F7),
  });

  Color get infoMain08 => infoMain.withOpacity(0.08);
  Color get infoMain24 => infoMain.withOpacity(0.24);
  Color get infoMain40 => infoMain.withOpacity(0.40);
  Color get infoMain56 => infoMain.withOpacity(0.56);
  Color get infoMain72 => infoMain.withOpacity(0.72);
  Color get infoMain88 => infoMain.withOpacity(0.88);

  Color get successMain08 => successMain.withOpacity(0.08);
  Color get successMain24 => successMain.withOpacity(0.24);
  Color get successMain40 => successMain.withOpacity(0.40);
  Color get successMain56 => successMain.withOpacity(0.56);
  Color get successMain72 => successMain.withOpacity(0.72);
  Color get successMain88 => successMain.withOpacity(0.88);

  Color get warningMain08 => warningMain.withOpacity(0.08);
  Color get warningMain24 => warningMain.withOpacity(0.24);
  Color get warningMain40 => warningMain.withOpacity(0.40);
  Color get warningMain56 => warningMain.withOpacity(0.56);
  Color get warningMain72 => warningMain.withOpacity(0.72);
  Color get warningMain88 => warningMain.withOpacity(0.88);

  Color get errorMain08 => errorMain.withOpacity(0.08);
  Color get errorMain24 => errorMain.withOpacity(0.24);
  Color get errorMain40 => errorMain.withOpacity(0.40);
  Color get errorMain56 => errorMain.withOpacity(0.56);
  Color get errorMain72 => errorMain.withOpacity(0.72);
  Color get errorMain88 => errorMain.withOpacity(0.88);

  Color grey1 = Color(0xFFEEF1F3);
  Color grey2 = Color(0xFFD3DFF4);
  Color grey3 = Color(0xFFF7F7F8);
  Color grey4 = Color(0xFF9A9A9A);
  Color grey8 = Color(0xFF434D56);

  /// Text colors
  Color get text1 => Color(0xFF000000);
  Color get text2 => Color(0xFF707070);

  /// Icon colors
  Color get icon1 => Color(0xFF707070);
  Color get icon2 => Color(0xFFFFA5A5);
  Color get icon3 => Color(0xFFFFFFFF);
}

final themeColor = ThemeColors();

ThemeData lightTheme = ThemeData(
  fontFamily: 'Figtree',
  colorScheme: ColorScheme(
    primary: themeColor.primary,
    brightness: Brightness.light,
    onPrimary: themeColor.onPrimary,
    secondary: themeColor.secondary,
    onSecondary: themeColor.onSecondary,
    surfaceTint: themeColor.surface,
    error: themeColor.errorMain,
    background: themeColor.fillBgWhite,
    onError: themeColor.onPrimary,
    onBackground: themeColor.onBackground,
    surface: themeColor.infoMain,
    onSurface: themeColor.onBackground,
  )
);