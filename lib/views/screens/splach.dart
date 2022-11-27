import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proj2_expense_manageent/main.dart';
import 'package:proj2_expense_manageent/views/screens/home.dart';

class SplachScreen extends StatefulWidget {
  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  navigationMethod() async {
    await Future.delayed(Duration(milliseconds: 1));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return MyHomePage();
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigationMethod();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.list,
          size: 50,
        ),
      ),
    );
  }
}
