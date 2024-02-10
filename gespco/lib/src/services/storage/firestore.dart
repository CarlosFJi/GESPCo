import 'package:cloud_firestore/cloud_firestore.dart';

import '../../shared/classes/dataUser.dart';

class CloudFirestoreService {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<String> init(UserModel user) async {
    print("serviceCF: ${user.toJson()}");
    final userMapping = user.toMap();

    Map<String, String> stringQueryParameters =
        userMapping.map((key, value) => MapEntry(key, value));

    return await addUser(stringQueryParameters);
  }

  Future<String> addUser(Map<String, dynamic> data) async {
    // Add a new document with a generated ID
    final document = await db.collection('user_access').add(data);
    print("serviceCF > add: $document");
    return document.id;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUsers() {
    return db.collection('user_access').snapshots();
  }
}

class DBController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> uploadingData(
      String description, String id, String title, bool newRegister) async {
    DateTime now = DateTime.now();
    if (newRegister)
      print("Nuevo registro: $description - $now");
    else {
      print("Logueado: $description + $now");
    }

    await FirebaseFirestore.instance.collection("user_access").add({
      'description': description,
      'id': id,
      'title': title,
    });
  }

  Future<String> add(Map<String, dynamic> data) async {
    // Add a new document with a generated ID
    final document = await firestore.collection("user_access").add(data);
    return document.id;
  }

  void getUser() {
    var cabesa = null;
    CollectionReference users =
        FirebaseFirestore.instance.collection('user_access');
    users.doc("0DXiWRIa021rK0L6c4xx").get().then((_) {
      cabesa = _;
      print("DOC USER: $_");
    });
    if (cabesa != null) print("CABESA GET: $cabesa");
  }

  void updateUser() {
    Stream collectionStream =
        FirebaseFirestore.instance.collection('user_access').snapshots();
    print("COLLECTION STREAM: $collectionStream");
    Stream documentStream = FirebaseFirestore.instance
        .collection('user_access')
        .doc('0DXiWRIa021rK0L6c4xx')
        .snapshots(includeMetadataChanges: true);
    print("Document STREAM: $documentStream");
  }
}
