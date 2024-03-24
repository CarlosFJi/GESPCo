import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gespco/src/shared/classes/dataEvent.dart';
import 'package:gespco/src/shared/classes/dataUser.dart';

class Firestore {
  static void newUser(UserModel data) async {
    Firestore.addOrUpdateWithId(
        "user_access", data.id!, UserModel.userToJson(data));
  }
  // TODO: Update user

  static void newEvent(DataEvent data) async {
    Firestore.addOrUpdateWithId(
        "events_managed", data.id!, DataEvent.toJson(data));
  }

  // Obtener entradas
  static Future<List<DataEvent>> getEvents(String col) async {
    return (await FirebaseFirestore.instance.collection(col).get())
        .docs
        .map((item) => DataEvent(
            title: item["title"]!,
            description: item["description"]!,
            id: item["id"]!))
        .toList();
  }

  // Obtener todas entradas de los eventos
  static Future<List<DataEvent>> getAllEntries(String collection) async {
    return (await FirebaseFirestore.instance.collection(collection).get())
        .docs
        .map((item) => DataEvent(
            title: item["title"],
            description: item["description"],
            id: item["id"]))
        .toList();
  }

  // Añadir por id
  static Future addOrUpdateWithId(
      String collection, String documentId, Map<String, dynamic> data) async {
    print("addOrUpdateWithId: $collection, docu: $documentId, data: $data");
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(documentId)
        .set(data);
  }

  // Borrar entradas
  static Future deleteEntry(String collection, String documentId) async {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(documentId)
        .delete();
  }

  // Actualiar entry
  static Future updateEntryWithId(
      String collection, String documentId, Map<String, dynamic> data) async {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(documentId)
        .update(data);
  }

  // Obtener por id
  /*
  static Future<List<DataEvent>> getAllEventsSortedById(
      String collection) async {
    return (await FirebaseFirestore.instance
            .collection(collection)
            .orderBy("id", descending: false)
            .get())
        .docs
        .map((item) => DataEvent.fromMap(jsonEncode(item)))
        .toList();
  }





  */
}
