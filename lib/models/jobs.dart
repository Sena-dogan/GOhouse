import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gohouse/models/user.dart';

class Job {
  late String id;
  late UserData user;
  late String name;
  late String category;
  late String image;
  late int price;
  late String description;
  late Timestamp createdAt;

  Job({
    required this.id,
    required this.user,
    required this.name,
    required this.category,
    required this.image,
    required this.price,
    required this.description,
    required this.createdAt,
  });

  Job.map(dynamic obj) {
    this.id = obj['id'];
    this.user = obj['user'];
    this.name = obj['name'];
    this.category = obj['category'];
    this.image = obj['image'];
    this.price = obj['price'];
    this.description = obj['description'];
    this.createdAt = obj['createdAt'];
  }

  String get _id => id;
  UserData get _user => user;
  String get _name => name;
  String get _category => category;
  String get _image => image;
  int get _price => price;
  String get _description => description;
  Timestamp get _createdAt => createdAt;

  Job.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.id;
    user = snapshot['user'];
    name = snapshot['name'];
    category = snapshot['category'];
    image = snapshot['image'];
    price = snapshot['price'];
    description = snapshot['description'];
    createdAt = snapshot['createdAt'];
  }
}
