import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/transaction.dart';

class SqlTransaction {
  Future<Database> get database async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
      join(await getDatabasesPath(), 'transactions_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE transactions(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL , fromid INTEGER, toid INTEGER ,fromname TEXT , toname TEXT ,amount INTEGER)',
        );
      },
      version: 1,
    );
    return database;
  }

  // Define a function that inserts dogs into the database
  Future<void> insertTransaction(EachTransaction transaction) async {
    final db = await database;
    await db.insert(
      'transactions',
      transaction.transactionMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Transactioninformation>> transactioninf() async {
    // Get a reference to the database.
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('transactions');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
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
}
