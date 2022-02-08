import 'package:bank/models/transaction.dart';
import 'package:bank/provider/initialize_db.dart';
import 'package:sqflite/sqflite.dart';

class TransferDB
{
  final DatabaseHelper _database;

  TransferDB(this._database);
    Future<List<Transactioninformation>> transactioninf() async {
     final Database db = await _database.initializeDB();

    final List<Map<String, dynamic>> maps = await db.query('transactions');

    return List.generate(maps.length, (i) {
      return Transactioninformation(
        amount: maps[i]['amount'],
        fromid: maps[i]['fromid'],
        toid: maps[i]['toid'],
        fromname: maps[i]['fromname'],
        toname: maps[i]['toname'],
      );
    });
  }

    Future<void> insertTransaction(EachTransaction transaction) async {
    final Database db = await _database.initializeDB() ;
    await db.insert(
      'transactions',
      transaction.transactionMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


}