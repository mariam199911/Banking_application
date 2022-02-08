import 'package:bank/models/customer.dart';

class EachTransaction {
  final Customer from;
  final Customer to;
  final int amount;

  EachTransaction({
    required this.from,
    required this.to,
    required this.amount,
  });

  Map<String, dynamic> transactionMap() {
    return {
      'fromid': from.id,
      'toid': to.id,
      'fromname': from.name,
      'toname': to.name,
      'amount': amount,
    };
  }

  @override
  String toString() {
    return 'transaction{fromid: ${from.id}, toid: ${to.name}, amount: $amount';
  }
}

class Transactioninformation {
  final int fromid;
  final int toid;
  final int amount;
  final String fromname;
  final String toname;
  Transactioninformation(
      {required this.amount,
      required this.fromid,
      required this.fromname,
      required this.toid,
      required this.toname});

  @override
  String toString() {
    return 'transaction{fromid: $fromname, toid: $toname, amount: $amount';
  }
}
