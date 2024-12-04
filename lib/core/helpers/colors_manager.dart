import 'dart:ui';

class ColorsManager {
// Primary Colors
  static const Color primary = Color(0xFF2563EB);       // Rich Blue
  static const Color secondary = Color(0xFF0F172A);     // Deep Navy
  
  // Accent Colors
  static const Color accent = Color(0xFF22C55E);        // Success Green
  static const Color warning = Color(0xFFF59E0B);       // Warning Orange
  static const Color error = Color(0xFFDC2626);         // Error Red
  
  // Light Theme Colors
  static const Color backgroundLight = Color(0xFFF8FAFC);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color textPrimaryLight = Color(0xFF1E293B);
  static const Color textSecondaryLight = Color(0xFF64748B);
  
  // Dark Theme Colors
  static const Color backgroundDark = Color(0xFF0F172A);
  static const Color surfaceDark = Color(0xFF1E293B);
  static const Color textPrimaryDark = Color(0xFFF8FAFC);
  static const Color textSecondaryDark = Color(0xFF94A3B8);
  
  // Chart Colors
  static const List<Color> chartColors = [
    Color(0xFF2563EB), // Blue
    Color(0xFF22C55E), // Green
    Color(0xFFF59E0B), // Orange
    Color(0xFF6366F1), // Indigo
    Color(0xFFEC4899), // Pink
  ];
}