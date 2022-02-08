import 'package:bank/provider/initialize_db.dart';
import 'package:bank/provider/transaction_helper.dart';
import 'package:flutter/material.dart';

import '../provider/sql_transaction.dart';
import '../widget/transaction_card.dart';

class AllTransactionsScreen extends StatefulWidget {
  static const routeName = '/all_transactions_screen';
  const AllTransactionsScreen({Key? key}) : super(key: key);

  @override
  State<AllTransactionsScreen> createState() => _AllTransactionsScreenState();
}

class _AllTransactionsScreenState extends State<AllTransactionsScreen> {
  late Future _detailsFuture;
  DatabaseHelper db1 = DatabaseHelper();
  late TransferDB transaction;

  @override
  void initState() {
    transaction = TransferDB(db1);

    _detailsFuture = transaction.transactioninf();
    super.initState();
  }
  // SqlTransaction db1 = new SqlTransaction();

  // @override
  // void initState() {
  //   _detailsFuture = db1.transactioninf();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[300],
        title: const Text("All Transactions"),
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
                  itemBuilder: (ctx, i) =>
                      TransactionCard(tr: snapshot.data[i]),
                  itemCount: snapshot.data.length,
                );
              }
            }
          }),
    );
  }
}
