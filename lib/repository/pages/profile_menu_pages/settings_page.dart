import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spliters/data/provider/dark_theme/dark_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),

      body: SafeArea(
        child: ListTile(
          title: Text("Theme"),
          trailing: Switch.adaptive(
            value: context.watch<DarkThemeProvider>().themeValue,
            onChanged: (value) {
              context.read<DarkThemeProvider>().themeValue = value;
            },
          ),
        ),
      ),
    );
  }
}
