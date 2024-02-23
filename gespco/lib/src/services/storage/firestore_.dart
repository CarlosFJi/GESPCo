import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gespco/src/shared/classes/dataEvent.dart';
import 'package:gespco/src/shared/classes/dataUser.dart';

class Firestore {
  static void newUser(UserModel data) async {
    final colection = Firestore.getEvents("user_access");
    print("colection: $colection");

    Firestore.addOrUpdateWithId(
        "user_access", data.id!, UserModel.userToJson(data));
  }

  // Obtener entradas
  static Future<List<DataEvent>> getEvents(String col) async {
    return (await FirebaseFirestore.instance.collection(col).get())
        .docs
        .map((item) => DataEvent.fromMap(item["data"].data()))
        .toList();
  }

  // Obtener todas entradas de los eventos
  static Future<List<DataEvent>> getAllEntries(String collection) async {
    return (await FirebaseFirestore.instance.collection(collection).get())
        .docs
        .map((item) => DataEvent.fromMap(item.data()))
        .toList();
  }

  // Obtener por id
  static Future<List<DataEvent>> getAllEventsSortedById(
      String collection) async {
    return (await FirebaseFirestore.instance
            .collection(collection)
            .orderBy("id", descending: false)
            .get())
        .docs
        .map((item) => DataEvent.fromMap(item.data()))
        .toList();
  }

  // Actualiar entry
  static Future updateEntryWithId(
      String collection, String documentId, Map<String, dynamic> data) async {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(documentId)
        .update(data);
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
}
