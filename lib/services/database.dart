

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

  Future updateUserData(
      String name, String surname, String email, int number, String image) async {
    return await userCollection.doc(uid).set({
      'id': uid,
      'name': name,
      'email': email,
      'surname': surname,
      'phone': number,
      'image': image,
    });
  }
}


