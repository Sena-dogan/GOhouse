import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  User? user;

  UserData({this.user});

  UserData.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? surname;
  String? name;
  int? phone;
  String? id;
  Updated? updated;
  String? image;
  String? email;

  User(
      {this.surname,
      this.name,
      this.phone,
      this.id,
      this.updated,
      this.image,
      this.email});

  User.fromJson(Map<String, dynamic> json) {
    surname = json['surname'];
    name = json['name'];
    phone = json['phone'];
    id = json['id'];
    updated =
        json['updated'] != null ? new Updated.fromJson(json['updated']) : null;
    image = json['image'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['surname'] = this.surname;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['id'] = this.id;
    if (this.updated != null) {
      data['updated'] = this.updated!.toJson();
    }
    data['image'] = this.image;
    data['email'] = this.email;
    return data;
  }
}

class Updated {
  int? iSeconds;
  int? iNanoseconds;

  Updated({this.iSeconds, this.iNanoseconds});

  Updated.fromJson(Map<String, dynamic> json) {
    iSeconds = json['_seconds'];
    iNanoseconds = json['_nanoseconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_seconds'] = this.iSeconds;
    data['_nanoseconds'] = this.iNanoseconds;
    return data;
  }
}

class GetUserRequest {
  String? email;

  GetUserRequest({this.email});

  GetUserRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    return data;
  }
}