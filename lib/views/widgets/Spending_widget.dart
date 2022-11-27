// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:proj2_expense_manageent/models/expense_model.dart';
import 'package:provider/provider.dart';

class SpendingElement extends StatelessWidget {
  ExpenseModel expenseModel;

  int index;
  SpendingElement(this.expenseModel, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12, bottom: 9, left: 16, right: 17),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
      decoration: BoxDecoration(
        border: Border.all(
            color: (getcolor()), width: 2.0, style: BorderStyle.solid),
        borderRadius: BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                expenseModel.title!,
                style: TextStyle(
                    color: getcolor(),
                    fontWeight: FontWeight.w900,
                    fontSize: 17),
              ),
              Text(
                expenseModel.descreption!,
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          Text(
            'Rs. ' + expenseModel.amount!,
            style: TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  getcolor() {
    int numm = (index + 1) % 4;
    if (numm == 1)
      return Colors.yellow;
    else if (numm == 2)
      return Colors.green;
    else if (numm == 3)
      return Colors.purple;
    else if (numm == 0) return Colors.orange;
  }
}

enum MyColors { red, orange, yellow, green, blue, indigo, violet }
