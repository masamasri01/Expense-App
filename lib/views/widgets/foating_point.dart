import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:proj2_expense_manageent/providers/provider_class.dart';
import 'package:provider/provider.dart';

class Float extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Add Expense'),
                insetPadding: const EdgeInsets.symmetric(
                  horizontal: 0.0,
                  vertical: 30.0,
                ),
                content: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        Positioned(
                          child: InkResponse(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: CircleAvatar(
                              child: Icon(Icons.close),
                            ),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'What did you spend on?',
                          ),
                          controller:
                              Provider.of<ProviderClass>(context, listen: false)
                                  .title,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Description on your spending',
                          ),
                          controller:
                              Provider.of<ProviderClass>(context, listen: false)
                                  .descreotion,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Rs. Enter amount',
                          ),
                          controller:
                              Provider.of<ProviderClass>(context, listen: false)
                                  .amount,
                        ),
                        ElevatedButton(
                          child: Text(
                            "Add",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            await Provider.of<ProviderClass>(context,
                                    listen: false)
                                .insertExpense();
                            // log('message');
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(50)),
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
