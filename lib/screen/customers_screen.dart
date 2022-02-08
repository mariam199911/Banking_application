import 'package:bank/provider/customer_helper.dart';
import 'package:bank/provider/initialize_db.dart';
import 'package:flutter/material.dart';

import '../provider/sql_helper.dart';
import '../widget/card.dart';

class AllCustomerScreen extends StatefulWidget {
  static const routeName = '/customers_screen';
  const AllCustomerScreen({Key? key}) : super(key: key);

  @override
  State<AllCustomerScreen> createState() => _AllCustomerScreenState();
}

class _AllCustomerScreenState extends State<AllCustomerScreen> {
  late Future _detailsFuture;
  // SqlHelper db1 = new SqlHelper();

  // @override
  // void initState() {
  //   _detailsFuture = db1.customersinf();
  //   super.initState();
  // }
  DatabaseHelper db1 = DatabaseHelper();
  late CustomerDB customer;

  @override
  void initState() {
    // load();
    // customer.insertItems();
    // db1.initializeDB().whenComplete(() {
    customer = CustomerDB(db1);
    // customer.insertItems();
    // });
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
                    itemBuilder: (ctx, i) => CustomerInfoItem(
                        // email: snapshot.data[i].email,
                        snapshot.data[i]),
                    itemCount: snapshot.data.length,
                  );
                }
              }
            }));
  }
}
