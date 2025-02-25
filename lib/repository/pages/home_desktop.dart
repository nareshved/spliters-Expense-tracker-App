import 'package:flutter/material.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: ListView(children: [
      Text("desktop page")
    ])));
  }
}
