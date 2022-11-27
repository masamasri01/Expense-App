// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:proj2_expense_manageent/providers/provider_class.dart';
import 'package:proj2_expense_manageent/views/widgets/Spending_widget.dart';

class AllExpensesScreen extends StatelessWidget {
  late DateTime dt;
  AllExpensesScreen({
    Key? key,
    required this.dt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<ProviderClass>(builder: (context, provider, x) {
      return Expanded(
        child: ListView.builder(
          itemCount: provider.allExpenses
              .where((element) => (element.date.day == dt.day &&
                  element.date.month == dt.month &&
                  element.date.year == dt.year))
              .length,
          itemBuilder: (context, index) {
            return SpendingElement(
                provider.allExpenses
                    .where((element) => (element.date.day == dt.day &&
                        element.date.month == dt.month &&
                        element.date.year == dt.year))
                    .toList()[index],
                index);
          },
        ),
      );
    });
  }
}
