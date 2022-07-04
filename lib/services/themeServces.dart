import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ThemeService {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);
  bool _loadthemeFrombox() => _box.read(_key) ?? false;
  ThemeMode get theme => _loadthemeFrombox() ? ThemeMode.dark : ThemeMode.light;
  void switchTheme() {
    Get.changeThemeMode(_loadthemeFrombox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadthemeFrombox());
  }
}
