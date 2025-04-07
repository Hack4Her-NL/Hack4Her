import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_theme.dart';
import 'dart:developer' as developer;

class ThemeProvider extends ChangeNotifier {
  static const String _themePreferenceKey = 'theme_mode';
  
  // Default to light mode
  ThemeMode _themeMode = ThemeMode.light;
  
  ThemeMode get themeMode => _themeMode;
  
  bool get isDarkMode => _themeMode == ThemeMode.dark;
  
  ThemeProvider() {
    _loadThemePreference();
  }
  
  // Load theme preference from shared preferences
  Future<void> _loadThemePreference() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedThemeMode = prefs.getString(_themePreferenceKey);
      
      if (savedThemeMode != null) {
        _themeMode = savedThemeMode == 'dark' ? ThemeMode.dark : ThemeMode.light;
        notifyListeners();
      }
    } catch (e) {
      // If there's an error (like in web sometimes), default to light mode
      _themeMode = ThemeMode.light;
      developer.log('Error loading theme preference: $e', name: 'ThemeProvider');
    }
  }
  
  // Save theme preference to shared preferences
  Future<void> _saveThemePreference(ThemeMode mode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_themePreferenceKey, mode == ThemeMode.dark ? 'dark' : 'light');
    } catch (e) {
      developer.log('Error saving theme preference: $e', name: 'ThemeProvider');
    }
  }
  
  // Toggle between light and dark mode
  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    
    // Try to save the preference, but don't block UI
    _saveThemePreference(_themeMode);
    
    // Always notify listeners even if saving fails
    notifyListeners();
  }
  
  // Set a specific theme mode
  void setThemeMode(ThemeMode mode) {
    if (_themeMode == mode) return;
    
    _themeMode = mode;
    _saveThemePreference(mode);
    notifyListeners();
  }
  
  // Get the current theme data
  ThemeData getTheme() {
    return _themeMode == ThemeMode.dark
        ? AppTheme.getDarkTheme()
        : AppTheme.getLightTheme();
  }
} 