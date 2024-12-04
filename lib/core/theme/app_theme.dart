import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/helpers/colors_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: ColorsManager.backgroundDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsManager.surfaceDark,
      foregroundColor: ColorsManager.textPrimaryDark,
      elevation: 0,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xFF14283c)),
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: ColorsManager.primary,
      primary: ColorsManager.primary,
      secondary: ColorsManager.secondary,
      surface: ColorsManager.surfaceDark,
      error: ColorsManager.error,
    ),
    textTheme: GoogleFonts.interTextTheme(
      Typography.blackCupertino,
    ),

    cardTheme: CardTheme(
      color: ColorsManager.surfaceDark,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFF14283c),
      labelTextStyle: WidgetStateProperty.resolveWith(
        (states) {
          return GoogleFonts.inter(
            fontSize: 12.sp,
            color: Colors.white,
            fontWeight: states.contains(WidgetState.selected)
                ? FontWeight.w600
                : FontWeight.w500,
          );
        },
      ),
    ),
    navigationRailTheme: const NavigationRailThemeData(
      backgroundColor: ColorsManager.surfaceDark,
      selectedIconTheme: IconThemeData(color: ColorsManager.primary),
      unselectedIconTheme:
          IconThemeData(color: ColorsManager.textSecondaryDark),
      selectedLabelTextStyle: TextStyle(color: ColorsManager.textPrimaryDark),
      unselectedLabelTextStyle:
          TextStyle(color: ColorsManager.textSecondaryDark),
    ),
  );
}
