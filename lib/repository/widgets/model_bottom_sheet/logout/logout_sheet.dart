import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spliters/data/bloc/register/register_bloc.dart';
import 'package:spliters/data/bloc/register/register_events.dart';
import 'package:spliters/repository/pages/login_page.dart';

class LogoutUserSheet {
  static logoutSheet({required BuildContext context}) {
    showModalBottomSheet(
      enableDrag: true,
      showDragHandle: true,
      sheetAnimationStyle: AnimationStyle(
        curve: Curves.easeInCirc,
        duration: Duration(seconds: 1),
      ),
      useSafeArea: true,
      context: context,
      builder: (context) {
        return Column(
          children: [
            ListTile(
              leading: Icon(Icons.thumb_up),
              title: Text("Yes"),

              onTap: () async {
                BlocProvider.of<RegisterBloc>(context).add(LogOutUserEvent());

                log("user tapped logout");

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("LogOut Success!")));

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.thumb_down),
              title: Text("No"),
              onTap: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }
}
