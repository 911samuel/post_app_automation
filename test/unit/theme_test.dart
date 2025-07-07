import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:post_app_testing/core/theme.dart';

void main() {
  late ThemeNotifier themeNotifier;

  setUp(() {
    themeNotifier = ThemeNotifier();
  });
  group('Theme Notifier', () {
    test('initial theme is light', () {
      expect(themeNotifier.themeMode, equals(ThemeMode.light));
    });
    test('toggleTheme switches from light to dark', () {
      themeNotifier.toggleTheme();
      expect(themeNotifier.themeMode, equals(ThemeMode.dark));
    });
    test('toggleTheme switches back from dark to light', () {
      themeNotifier.toggleTheme();
      themeNotifier.toggleTheme();
      expect(themeNotifier.themeMode, equals(ThemeMode.light));
    });
  });
}
