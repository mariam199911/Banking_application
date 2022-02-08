import 'package:flutter/material.dart';

import '../models/customer.dart';
import '../screen/bottom_sheet.dart';
import '../widget/customer_info_card.dart';

class CustomerDetailsScreen extends StatelessWidget {
  final Customer co;
  CustomerDetailsScreen(this.co);
  static const routeName = '/customer_details_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan[300],
          title: const Text("Customer Information"),
        ),
        body: Column(children: [
          CustomerInfornationCard(co),
          RaisedButton(
            child: const Text('Transfer Money',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: BottomSheetExample(co),
                  ),
                ),
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.red[400],
          ),
        ]));
  }
}
