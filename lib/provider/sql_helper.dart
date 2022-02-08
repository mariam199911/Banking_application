import 'dart:async';

import 'package:bank/models/customer.dart';
import 'package:flutter/widgets.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlHelper {
  Future<Database> get database async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
      join(await getDatabasesPath(), 'bank2_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE customers(id INTEGER PRIMARY KEY, name TEXT,email TEXT ,balance INTEGER)',
        );
      },
      version: 1,
    );
    return database;
  }

  Future<void> insertCustomer(Customer customer) async {
    final db = await database;

    await db.insert(
      'customers',
      customer.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Customer>> customersinf() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('customers');

    return List.generate(maps.length, (i) {
      return Customer(
        id: maps[i]['id'],
        name: maps[i]['name'],
        email: maps[i]['email'],
        balance: maps[i]['balance'],
      );
    });
  }

  Future<void> updateCustomer(Customer customer) async {
    final db = await database;
    await db.update(
      'customers',
      customer.toMap(),
      where: 'id = ?',
      whereArgs: [customer.id],
    );
  }
}

//////////////////  insertion ////////////////////////////////
  // var first = Customer(
  //   id: 1,
  //   name: 'Mariam',
  //   email: 'mariammohammad390@gmail.com',
  //   balance: 1000,
  // );
  // await insertCustomer(first);
  // var second = Customer(
  //   id: 2,
  //   name: 'Rede',
  //   email: 'Reda@gmail.com',
  //   balance: 5000,
  // );
  // await insertCustomer(second);
  // var third = Customer(
  //   id: 3,
  //   name: 'ayman',
  //   email: 'a@gmail.com',
  //   balance: 100,
  // );
  // await insertCustomer(third);
  // var fo = Customer(
  //   id: 4,
  //   name: 'Mohamed',
  //   email: 'mohamed456@gmail.com',
  //   balance: 10000,
  // );
  // await insertCustomer(fo);
  // var fi = Customer(
  //   id: 5,
  //   name: 'Ali',
  //   email: 'Ali_Reda@gmail.com',
  //   balance: 3000,
  // );
  // await insertCustomer(fi);
  // var se = Customer(
  //   id: 6,
  //   name: 'Hager',
  //   email: 'hager23@gmail.com',
  //   balance: 0,
  // );
  // await insertCustomer(se);
  // var siv = Customer(
  //   id: 7,
  //   name: 'Fatma',
  //   email: 'fa9802@gmail.com',
  //   balance: 200,
  // );
  // await insertCustomer(siv);
  // var ei = Customer(
  //   id: 8,
  //   name: 'laila',
  //   email: 'lil@gmail.com',
  //   balance: 5000,
  // );
  // await insertCustomer(ei);
  // var nin = Customer(
  //   id: 9,
  //   name: 'aya',
  //   email: 'ayooo@gmail.com',
  //   balance: 20000,
  // );
  // await insertCustomer(nin);
  // var ten = Customer(
  //   id: 10,
  //   name: 'Memo',
  //   email: 'mm@gmail.com',
  //   balance: 900,
  // );
  // await insertCustomer(ten);


//   Future<Database> get database async {
//     WidgetsFlutterBinding.ensureInitialized();
//     final database = openDatabase(
//       join(await getDatabasesPath(), 'bank2_database.db'),
//       onCreate: (db, version) async{
//         await db.execute(
//           'CREATE TABLE customers(id INTEGER PRIMARY KEY, name TEXT,email TEXT ,balance INTEGER)',
//         );
//          await db.execute(
//           'CREATE TABLE transactions(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL , fromid INTEGER , toid INTEGER ,amount INTEGER,FOREIGN KEY (fromid) REFERENCES Type (id))');
//       },
//       version: 1,
//     );
//     return database;
//   }
// Future<List> queryAll() async {    
//    Database db = await database;     
//    List<Map> names = await db.rawQuery(         
//   'select Name.name, count(Date.date) from Name left join Date using(id) group by Name.name');     
//   if (names.length > 0) {
//            return names;     
//            }     
//            return null;   }