import 'package:bank/models/customer.dart';
import 'package:bank/provider/initialize_db.dart';
import 'package:sqflite/sqflite.dart';

class CustomerDB {
  final DatabaseHelper _database;

  CustomerDB(this._database);

  Future<List<Customer>> customersinf() async {
    final db = await _database.initializeDB();

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

  Future<void> insertItems() async {
    final Database db = await _database.initializeDB();
    await db.insert(
        'customers',
        Customer(
          id: 1,
          name: 'Mariam',
          email: 'mariammohammad390@gmail.com',
          balance: 1000,
        ).toMap());
    await db.insert(
        'customers',
        Customer(
          id: 2,
          name: 'Rede',
          email: 'Reda@gmail.com',
          balance: 5000,
        ).toMap());

    await db.insert(
        'customers',
        Customer(
          id: 3,
          name: 'ayman',
          email: 'a@gmail.com',
          balance: 100,
        ).toMap());
    await db.insert(
        'customers',
        Customer(
          id: 4,
          name: 'Mohamed',
          email: 'mohamed456@gmail.com',
          balance: 10000,
        ).toMap());
    await db.insert(
        'customers',
        Customer(
          id: 5,
          name: 'Ali',
          email: 'Ali_Reda@gmail.com',
          balance: 3000,
        ).toMap());
    await db.insert(
        'customers',
        Customer(
          id: 6,
          name: 'Hager',
          email: 'hager23@gmail.com',
          balance: 0,
        ).toMap());
    await db.insert(
        'customers',
        Customer(
          id: 7,
          name: 'Fatma',
          email: 'fa9802@gmail.com',
          balance: 200,
        ).toMap());
    await db.insert(
        'customers',
        Customer(
          id: 8,
          name: 'laila',
          email: 'lil@gmail.com',
          balance: 5000,
        ).toMap());
    await db.insert(
        'customers',
        Customer(
          id: 9,
          name: 'aya',
          email: 'ayooo@gmail.com',
          balance: 20000,
        ).toMap());
    await db.insert(
        'customers',
        Customer(
          id: 10,
          name: 'abd elrahman',
          email: 'ad024@gmail.com',
          balance: 20000,
        ).toMap());
  }

  Future<void> updateCustomer(Customer customer) async {
    final db = await _database.initializeDB();
    await db.update(
      'customers',
      customer.toMap(),
      where: 'id = ?',
      whereArgs: [customer.id],
    );
  }
}
