import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:gohouse/models/user.dart';

class Job {
  late String id;
  late String user;
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

  Map <String, dynamic> toJson() => {
    'id': id,
    'user': user,
    'name': name,
    'category': category,
    'image': image,
    'price': price,
    'description': description,
    'createdAt': createdAt,
  };
  static Job fromJson(Map<String, dynamic> json) => Job(
    id: json['id'],
    user: json['user'],
    name: json['name'],
    category: json['category'],
    image: json['image'],
    price: json['price'],
    description: json['description'],
    createdAt: json['createdAt'],
  );
}

