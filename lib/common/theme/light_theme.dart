import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData _themeLight = ThemeData.light(useMaterial3: true);

ThemeData themeLight = _themeLight.copyWith(
  scaffoldBackgroundColor: AppColors.white,
  colorScheme: _schemeLight(_themeLight.colorScheme),
  textTheme: _textLight(_themeLight.textTheme),
  elevatedButtonTheme: ElevatedButtonThemeData(style: _elevButtonLight),
  textButtonTheme: TextButtonThemeData(style: _textButtonLight),
  outlinedButtonTheme: OutlinedButtonThemeData(style: _outlinedButtonLight),
  appBarTheme: _appBarLight(_themeLight.appBarTheme),
  bottomAppBarTheme: _bottomAppBarLight(_themeLight.bottomAppBarTheme),
  inputDecorationTheme: _inputDecorLight(_themeLight.inputDecorationTheme),
  chipTheme: _chipLight(_themeLight.chipTheme),
);

ColorScheme _schemeLight(ColorScheme base) {
  return base.copyWith(
    primary: AppColors.blue,
    error: AppColors.error,
  );
}

TextTheme _textLight(TextTheme base) {
  return base.copyWith(
    bodyMedium: base.bodyMedium!.copyWith(
      fontSize: 16,
      height: 19.2 / 16,
      // fontFamily: 'SF',
    ),
    labelLarge: base.labelLarge!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 19.2 / 16,
      // fontFamily: 'SF',
      color: AppColors.blue,
    ),
    bodySmall: base.bodySmall!.copyWith(
      fontSize: 14,
      // fontFamily: 'SF',
      color: AppColors.grey,
    ),
    titleMedium: base.titleMedium!.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      // fontFamily: 'SF',
    ),
    titleSmall: base.titleMedium!.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      // fontFamily: 'SF',
    ),
    titleLarge: base.titleLarge!.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.blue,
      // fontFamily: 'SF',
    ),
  );
}

ButtonStyle _elevButtonLight = ElevatedButton.styleFrom(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  textStyle: const TextStyle(fontSize: 18),
  backgroundColor: AppColors.blue,
  foregroundColor: AppColors.white,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
);

ButtonStyle _textButtonLight = TextButton.styleFrom(
  foregroundColor: AppColors.blue,
  padding: EdgeInsets.zero,
);

ButtonStyle _outlinedButtonLight = OutlinedButton.styleFrom(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  textStyle: const TextStyle(fontSize: 18),
  shape: const StadiumBorder(side: BorderSide(color: AppColors.blue, width: 2)),
);

AppBarTheme _appBarLight(AppBarTheme base) {
  return base.copyWith(
    backgroundColor: AppColors.white,
    foregroundColor: AppColors.black,
    elevation: 0.0,
    centerTitle: true,
    surfaceTintColor: AppColors.white,
  );
}

BottomAppBarTheme _bottomAppBarLight(BottomAppBarTheme base) {
  return base.copyWith(
    color: AppColors.white,
    elevation: 3,
    surfaceTintColor: AppColors.white,
    shadowColor: AppColors.black,
  );
}

InputDecorationTheme _inputDecorLight(InputDecorationTheme base) {
  return base.copyWith(
    isDense: true,
    filled: true,
    fillColor: MaterialStateColor.resolveWith((Set<MaterialState> states) =>
        states.contains(MaterialState.error)
            ? AppColors.error.withOpacity(0.15)
            : AppColors.greyLight),
    // labelStyle: const TextStyle(color: AppColor.textLow),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    ),
    hintStyle: const TextStyle(fontWeight: FontWeight.normal),
  );
}

ChipThemeData _chipLight(ChipThemeData base) {
  return base.copyWith(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    side: BorderSide.none,
    showCheckmark: false,
    padding: const EdgeInsets.all(8),
    backgroundColor: MaterialStateColor.resolveWith(
      (Set<MaterialState> states) => states.contains(MaterialState.selected)
          ? AppColors.blueLight
          : AppColors.greyLight,
    ),
    labelStyle: const TextStyle(color: AppColors.black),
  );
}
