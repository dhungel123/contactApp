import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../feature/contact_page/model/customer.dart';


class DBHelper{
   // 1.Defining database
  static Database?  _database;

  // 2. Tables
 static const String tableUser = 'User';
 static const String tableProduct = 'Product';
 static const String dbName= 'app.db';


  // 3.
  Future<Database?> get db async {
    // return if database is already exist
    if(_database != null ){
       return _database;
    }
      // else create a database and  return
    _database = await  initDatabase();
    return _database;
  }

  // 4. Initialize or create db
  Future<Database?> initDatabase() async{


    final Directory appDocumentDir = await getApplicationDocumentsDirectory();

    // Add the database name here
    String path = join(appDocumentDir.path, dbName);
    try{

      print('=====database path==$path');

      var db= await openDatabase( path,version:1 ,onCreate: _onCreate);

      return db;

    }catch(error){
      print('error $error');

    }

  }
   Future _onCreate(Database db , int version ) async {


     await db.execute('CREATE TABLE $tableUser '
         '(id INTEGER PRIMARY KEY '
         'AUTOINCREMENT,'
         ' name TEXT,'
         ' email TEXT,'
         ' phone TEXT,'
         ' city TEXT'
         ')');

     await db.execute('CREATE TABLE $tableProduct '
         '(id INTEGER PRIMARY KEY,'
         ' name TEXT'
         ')');

   }

   Future<Customer> addCustomer(Customer customer) async {
    var dbClient= await db;

    try{
     await dbClient?.insert(tableUser, customer.toJson());
      print('customer Record: ${customer.name}');
      return customer;
    }catch(e){
      print('error while adding customer $e');
      rethrow;
    }




   }

  Future<List<Customer>> getSavedCustomers() async {
    var dbClient = await db;
    try {

      List<Map<String, Object?>>? maps = await dbClient?.query(tableUser);
      List<Customer> customers = [];

      if (maps != null && maps.isNotEmpty ) {
        for (var map in maps) {
          customers.add(Customer.fromMap(map));
        }
      }
      return customers;
    } catch (e) {
      print('Error fetching saved customers: $e');
      return [];
    }
  }

  Future deleteCustomer(int customerId) async {
    var dbClient = await db;
    try {
      await dbClient?.delete(tableUser, where: 'id = ?', whereArgs: [customerId]);
      print('Customer deleted successfully');
    } catch (e) {
      print('Error deleting customer: $e');
    }


  }


}