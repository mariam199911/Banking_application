import 'package:bank/provider/customer_helper.dart';
import 'package:bank/provider/initialize_db.dart';
import 'package:flutter/material.dart';

import '../models/customer.dart';
import '../provider/sql_helper.dart';
import '../widget/select_to_transfare.dart';

class TransferToCustomerScreen extends StatefulWidget {
  final int amount;
  final Customer from;
  TransferToCustomerScreen({required this.from, required this.amount});
  static const routeName = '/transfare_to_screen';

  @override
  State<TransferToCustomerScreen> createState() =>
      _TransferToCustomerScreenState();
}

class _TransferToCustomerScreenState extends State<TransferToCustomerScreen> {
  late Future _detailsFuture;
  // SqlHelper db1 = new SqlHelper();

  // @override
  // void initState() {
  //   print(widget.amount);
  //   print(widget.from);
  //   _detailsFuture = db1.customersinf();
  //   super.initState();
  // }
  DatabaseHelper db1 = DatabaseHelper();
  late CustomerDB customer;

  @override
  void initState() {
    customer = CustomerDB(db1);

    _detailsFuture = customer.customersinf();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan[300],
          title: const Text("All Customers"),
        ),
        body: FutureBuilder(
            future: _detailsFuture,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(color: Color(0xFF165DC0)));
              } else {
                if (snapshot.error != null) {
                  print(snapshot.error);
                  // ...
                  // Do error handling stuff
                  return const Center(
                    child: Text('An error occurred!'),
                  );
                } else {
                  return ListView.builder(
                    itemBuilder: (ctx, i) => ChooseCustomer(
                      amount: widget.amount,
                      co: snapshot.data[i],
                      from: widget.from,
                    ),
                    itemCount: 10,
                  );
                }
              }
            }));
  }
}
