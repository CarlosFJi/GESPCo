import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:gespco/src/services/storage/firestore.dart';
import 'package:gespco/src/shared/classes/dataEvent.dart';
import 'package:gespco/src/shared/classes/dataUser.dart';
import 'package:gespco/src/shared/classes/dataTicket.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class DBManage {
  static const String databaseName = "gespco.db";
  static Database? db;

  Future<Database> initizateDb() async {
    var factory = databaseFactoryFfiWeb;
    final db = await factory.openDatabase('gespco.db');

    var sqliteVersion =
        (await db.rawQuery('select sqlite_version()')).first.values.first;
    if (kDebugMode) print(" versión: $sqliteVersion");
    final checkDB = db.query('users').toString();
    if (checkDB != "") await createTables(db);
    return db;
  }

  // TODO: CREATE SQL_SENTENCES
  static Future<void> createTables(Database database) async {
    await database.execute(
        "CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT, photoURL TEXT, role TEXT);" +
            "CREATE TABLE events (id INTEGER PRIMARY KEY, description TEXT, title TEXT);" +
            "CREATE TABLE tickets (id TEXT, name TEXT, dueDate TEXT, double DOUBLE, barcode TEXT));");
  }

  // INSERT
  Future<int> insertUser(UserModel user) async {
    Database database = await initizateDb();

    return database.insert("users", user.toMap());
  }

  Future<int> insertTicket(TicketModel tickets) async {
    Database database = await initizateDb();
    return database.insert("tickets", tickets.toMap());
  }

  Future<int> insertEvent(DataEvent events) async {
    Database database = await initizateDb();

    return database.insert("tickets", events.toMap());
  }

  // DELETE
  Future<int> deleteUser(UserModel user) async {
    Database database = await initizateDb();

    return database.delete("users", where: 'id = ?', whereArgs: [user.id]);
  }

// UPDATe
  Future<int> updateUpdate(UserModel user) async {
    Database database = await initizateDb();

    return database
        .update("users", user.toMap(), where: 'id = ?', whereArgs: [user.id]);
  }

  Future<List<UserModel>> user() async {
    Database database = await initizateDb();
    final List<Map<String, dynamic>> userMap = await database.query("user");

    for (var n in userMap) {
      if (kDebugMode) print("____" + n['name']);
    }

    return List.generate(
        userMap.length,
        (i) => UserModel(
              id: userMap[i]['id'],
              name: userMap[i]['name'],
              photoURL: userMap[i]['photoURL'],
              role: userMap[i]['role'],
            ));
  }
}




/*
 //TODO: Activar DB en móvil
    String os = Platform.operatingSystem;
    print("OS: $os");
    if (os && Platform.isAndroid || Platform.isIOS) {

      print("dispositivo móvil");
    }
*/