import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          bottomOpacity: 0.4,
          title: Text(
            'Profile',
          ),
          backgroundColor: Colors.white),
      body: Stack(children: [
        Container(
          height: 180,
          color: Color.fromRGBO(60, 234, 155, 1),
        ),
        Container(
          margin: EdgeInsets.only(top: 115, left: 130),
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 60,
            child: Text(
              'MM',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ), //Text
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 250, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text('Masah', style: TextStyle(fontSize: 17))
                    ],
                  ),
                  Text('Edit', style: TextStyle(fontSize: 17))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email ID',
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text('masah.masri@gmail.com',
                          style: TextStyle(fontSize: 17))
                    ],
                  ),
                  Text('Edit', style: TextStyle(fontSize: 17))
                ],
              ),
              const Divider(
                thickness: 2,
                color: Color.fromARGB(255, 201, 199, 199),
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Password',
                    style: TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                  Text('Edit', style: TextStyle(fontSize: 17))
                ],
              ),
              const Divider(
                thickness: 2,
                color: Color.fromARGB(255, 201, 199, 199),
                height: 50,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
