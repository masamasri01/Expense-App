import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:proj2_expense_manageent/providers/provider_class.dart';
import 'package:proj2_expense_manageent/views/screens/home.dart';
import 'package:proj2_expense_manageent/views/screens/my_expenses_page.dart';
import 'package:proj2_expense_manageent/views/screens/profile.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      MyHomePage(),
      MyExpensesPage(),
      Profile(),
    ];
    return BottomNavigationBar(
        currentIndex:
            Provider.of<ProviderClass>(context, listen: false).pageIndex,
        onTap: (index) {
          Provider.of<ProviderClass>(context, listen: false).pageIndex = index;
        },
        iconSize: 20,
        backgroundColor: Colors.white,
        selectedItemColor: const Color.fromRGBO(60, 234, 155, 1),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color.fromARGB(255, 209, 205, 205),
        unselectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.money_rounded,
            ),
            label: 'My Expenses',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: 'Profile',
          )
        ]);
  }
}
