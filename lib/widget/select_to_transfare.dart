import 'package:flutter/material.dart';

import '../models/customer.dart';
import '../models/transaction.dart';
import '../provider/sql_helper.dart';
import '../provider/sql_transaction.dart';

class ChooseCustomer extends StatelessWidget {
  final Customer co;
  final Customer from;
  final int amount;

  ChooseCustomer({required this.co, required this.amount, required this.from});
  @override
  Widget build(BuildContext context) {
    int to;
    Customer tocustomer = Customer(
        id: co.id,
        email: co.email,
        name: co.name,
        balance: co.balance + amount);
    Customer fromcustomer = Customer(
        id: from.id,
        name: from.name,
        email: from.email,
        balance: from.balance - amount);

    return InkWell(
      onTap: () {
        SqlHelper db1 = new SqlHelper();
        db1.updateCustomer(tocustomer);
        db1.updateCustomer(fromcustomer);
        SqlTransaction db2 = new SqlTransaction();
        EachTransaction newTransaction =
            EachTransaction(from: from, to: co, amount: amount);
        db2.insertTransaction(newTransaction);
        // Future<List<Transactioninformation>> n = db2.transactioninf();

        Navigator.pushReplacementNamed(context, '/finish_screen');
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0, left: 8, right: 8),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(
                co.name,
                style: const TextStyle(fontSize: 20),
              ),
              subtitle: Column(children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'email : ' + co.email,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Balance : ' + co.balance.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.end,
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
