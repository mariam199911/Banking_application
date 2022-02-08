import 'package:flutter/material.dart';

import '../screen/all_done_screen.dart';
import '../screen/all_transactions.dart';
import '../screen/customers_screen.dart';
import '../screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark(),
      title: 'Bank',
      theme: ThemeData(
        primaryColor: const Color(0xFF165DC0),
        canvasColor: const Color(0xffe9efff),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans-Light',
            color: Colors.black,
          ),
          bodyText1: TextStyle(
              fontSize: 16.0,
              fontFamily: 'OpenSans-Light',
              fontWeight: FontWeight.normal),
          bodyText2: TextStyle(
              fontSize: 22.0,
              fontFamily: 'OpenSans-Light',
              fontWeight: FontWeight.normal),
          button: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans-Light',
          ),
        ),
      ),
      // home: SplashScreen(),
      home: HomeScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        AllCustomerScreen.routeName: (ctx) => AllCustomerScreen(),
        //CustomerDetailsScreen.routeName: (ctx) => CustomerDetailsScreen(''),
        // TransferToCustomerScreen.routeName: (ctx) => TransferToCustomerScreen(),
        FinishInterview.routeName: (ctx) => FinishInterview(),
        AllTransactionsScreen.routeName: (ctx) => AllTransactionsScreen(),
      },
    );
  }
}
