import 'package:bank/models/customer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomerInfornationCard extends StatelessWidget {
  final Customer co;
  CustomerInfornationCard(this.co);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 220,
      width: double.infinity,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 9),
                child: Center(
                  child: Text(
                    'Applicant Information',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'ID: ${co.id}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Name: ${co.name}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Email: ${co.email}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Balance: ${co.balance}\$',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
