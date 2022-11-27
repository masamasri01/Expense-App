import 'package:flutter/material.dart';
import 'package:proj2_expense_manageent/providers/provider_class.dart';
import 'package:proj2_expense_manageent/views/screens/home.dart';
import 'package:proj2_expense_manageent/views/screens/my_expenses_page.dart';
import 'package:proj2_expense_manageent/views/screens/profile.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> pages = [
      MyHomePage(),
      MyExpensesPage(),
      Profile(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            Provider.of<ProviderClass>(context, listen: true).pageIndex,
        onTap: (value) {
          Provider.of<ProviderClass>(context, listen: false)
              .changePageIndex(value);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.money_rounded,
            ),
            label: 'My Expenses',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: 'Profile',
          )
        ],
      ),
      body: pages[Provider.of<ProviderClass>(context).pageIndex],
    );
  }
}
