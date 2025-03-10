import 'package:flutter/material.dart';
import 'package:spliters/repository/pages/profile_menu_pages/account_page.dart';
import 'package:spliters/repository/pages/profile_menu_pages/settings_page.dart';

class ProfileItemsList {
  static List<Map<String, dynamic>> allItems = [
    {"icon": Icons.account_balance_wallet, "title": "Account"},
    {"icon": Icons.settings, "title": "Settings"},
    // {"icon": Icons.logout, "title": "LogOut"},
  ];

  static List<Widget> profileMenupages = [AccountPage(), SettingsPage()];
}
