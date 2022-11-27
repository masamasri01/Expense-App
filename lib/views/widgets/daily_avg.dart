// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DailyAvg extends StatelessWidget {
  String amount;
  DailyAvg({
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 25),
      child: Text(
        'Your Daily Average : Rs.$amount',
        style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 95, 94, 94)),
      ),
    );
  }
}
