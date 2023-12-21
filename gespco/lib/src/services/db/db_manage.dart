import 'package:gespco/src/shared/classes/dataEvent.dart';
import 'package:gespco/src/shared/classes/dataUser.dart';
import 'package:gespco/src/shared/classes/dataTicket.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class DBManage {
  static const String databaseName = "gespco.db";
  static Database? db;

  static Future<Database> initizateDb() async {
    var factory = databaseFactoryFfiWeb;
    final db = await factory.openDatabase('gespco.db');
    var sqliteVersion =
        (await db.rawQuery('select sqlite_version()')).first.values.first;
    print(sqliteVersion);
    if (db.query('users') == null) await createTables(db);

    return db;
  }

  static Future<void> createTables(Database database) async {
    await database.execute(
        "CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT, photoURL TEXT, role TEXT);" +
            "CREATE TABLE events (id INTEGER PRIMARY KEY, description TEXT, title TEXT);" +
            "CREATE TABLE tickets (id TEXT, name TEXT, dueDate TEXT, double DOUBLE, barcode TEXT));");
  }

  // INSERT
  static Future<int> insertUser(UserModel user) async {
    Database database = await initizateDb();

    return database.insert("users", user.toMap());
  }

  static Future<int> insertTicket(TicketModel tickets) async {
    Database database = await initizateDb();
    return database.insert("tickets", tickets.toMap());
  }

  static Future<int> insertEvent(DataEvent events) async {
    Database database = await initizateDb();

    return database.insert("tickets", events.toMap());
  }

  // DELETE
  static Future<int> deleteUser(UserModel user) async {
    Database database = await initizateDb();

    return database.delete("users", where: 'id = ?', whereArgs: [user.id]);
  }

// UPDATe
  static Future<int> updateUpdate(UserModel user) async {
    Database database = await initizateDb();

    return database
        .update("users", user.toMap(), where: 'id = ?', whereArgs: [user.id]);
  }

  static Future<List<UserModel>> user() async {
    Database database = await initizateDb();
    final List<Map<String, dynamic>> userMap = await database.query("user");

    for (var n in userMap) {
      print("____" + n['name']);
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