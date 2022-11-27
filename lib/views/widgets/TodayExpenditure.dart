// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import 'package:proj2_expense_manageent/models/expense_model.dart';

import '../../providers/provider_class.dart';

class TodayExpenditure extends StatelessWidget {
  late DateTime dt;
  TodayExpenditure({
    Key? key,
    required this.dt,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.symmetric(vertical: 15),
      height: 47,
      color: Color.fromARGB(179, 231, 231, 231),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Today's Expenditure",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          Text(
              'Rs. ${Provider.of<ProviderClass>(context).getExpenditureOfDate(dt)}',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16))
        ],
      ),
    );
  }
}
