import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/intro_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: CircleAvatar(
                radius: 170,
                backgroundImage: AssetImage('assets/images/4.jpg')),
          ),
          const SizedBox(
            height: 20,
          ),
          RaisedButton(
            child: const Text('All Customets',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            onPressed: () {
              Navigator.pushNamed(context, '/customers_screen');
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.red[400],
          ),
          const SizedBox(
            height: 20,
          ),
          RaisedButton(
            child: const Text('All Transactions',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            onPressed: () {
              Navigator.pushNamed(context, '/all_transactions_screen');
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.red[400],
          ),
          // RaisedButton(
          //   color: Colors.cyan[200],
          //   onPressed: () {
          //     Navigator.pushNamed(context, '/customers_screen');
          //   },
          //   child: const Text(
          //     'All Customets',
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
