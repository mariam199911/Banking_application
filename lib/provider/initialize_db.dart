import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'banking_database.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE customers(id INTEGER PRIMARY KEY, name TEXT,email TEXT ,balance DOUBLE)",
        );
        await database.execute(
          "CREATE TABLE transactions(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL , fromid INTEGER, toid INTEGER ,fromname TEXT , toname TEXT ,amount INTEGER)",
        );
      },
      version: 1,
    );
  }
}
