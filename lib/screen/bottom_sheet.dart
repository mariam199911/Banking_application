import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/customer.dart';
import '../screen/transfate_to_secreen.dart';

class BottomSheetExample extends StatefulWidget {
  final Customer from;
  BottomSheetExample(this.from);

  @override
  State<BottomSheetExample> createState() => _BottomSheetExampleState();
}

class _BottomSheetExampleState extends State<BottomSheetExample> {
  int amount = 0;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Enter The Amount ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                //color: Colors.blue,
              ),
            ),
            TextField(
              autofocus: true,
              controller: _controller,
              cursorColor: Colors.red[400],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
            ),
            FlatButton(
              child: const Text(
                'Transfare To',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red[400],
              onPressed: () {
                amount = int.parse(_controller.text);
                print(amount);
                if (amount > widget.from.balance) {
                  showDialog(
                      context: context,
                      builder: (ctxt) => AlertDialog(
                            title: const Text('Error'),
                            content: const Text(
                                " There is no enough money to transfer"),
                            actions: [
                              FlatButton(
                                textColor: Colors.black,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Ok'),
                              ),
                            ],
                          ));
                } else {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => (TransferToCustomerScreen(
                          from: widget.from, amount: amount))));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
