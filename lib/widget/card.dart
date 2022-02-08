import 'package:flutter/material.dart';

import '../models/customer.dart';
import '../screen/customer_details_screen.dart';

class CustomerInfoItem extends StatelessWidget {
  final Customer co;
  CustomerInfoItem(this.co);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => (CustomerDetailsScreen(co))));
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
                      'Balance : ' + co.balance.toString() + '\$',
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
