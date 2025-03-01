import 'package:flutter/material.dart';
import 'package:spliters/repository/pages/nav_bar_pages/budget.dart';
import 'package:spliters/repository/pages/nav_bar_pages/home.dart';
import 'package:spliters/repository/pages/nav_bar_pages/profile.dart';
import 'package:spliters/repository/pages/nav_bar_pages/transactions.dart';

class NavBarHomePage extends StatefulWidget {
  const NavBarHomePage({super.key});

  @override
  State<NavBarHomePage> createState() => _NavBarHomePageState();
}

class _NavBarHomePageState extends State<NavBarHomePage> {
  int mSelectedIndex = 0;

  List<Widget> navPagesList = [
    HomePageNavBar(),
    TransactionsPage(),
    BudgetPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navPagesList[mSelectedIndex],
      bottomNavigationBar: NavigationBar(
        indicatorColor: Theme.of(context).colorScheme.primary,
        selectedIndex: mSelectedIndex,
        onDestinationSelected: (index) {
          mSelectedIndex = index;
          setState(() {});
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home_filled), label: "Home"),
          NavigationDestination(
            icon: Icon(Icons.swap_horiz_rounded),
            label: "Transactions",
          ),
          NavigationDestination(icon: Icon(Icons.pie_chart), label: "Budget"),
          NavigationDestination(icon: Icon(Icons.person_2), label: "Profile"),
        ],
      ),
    );
  }
}
