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

class EditUserRequest {
  int? _phone;
  String? _surname;
  String? _image;
  String? _id;
  String? _email;
  String? _name;

  EditUserRequest(
      {int? phone,
      String? surname,
      String? image,
      String? id,
      String? email,
      String? name}) {
    if (phone != null) {
      this._phone = phone;
    }
    if (surname != null) {
      this._surname = surname;
    }
    if (image != null) {
      this._image = image;
    }
    if (id != null) {
      this._id = id;
    }
    if (email != null) {
      this._email = email;
    }
    if (name != null) {
      this._name = name;
    }
  }

  int? get phone => _phone;
  set phone(int? phone) => _phone = phone;
  String? get surname => _surname;
  set surname(String? surname) => _surname = surname;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get id => _id;
  set id(String? id) => _id = id;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get name => _name;
  set name(String? name) => _name = name;

  EditUserRequest.fromJson(Map<String, dynamic> json) {
    _phone = json['phone'];
    _surname = json['surname'];
    _image = json['image'];
    _id = json['id'];
    _email = json['email'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this._phone;
    data['surname'] = this._surname;
    data['image'] = this._image;
    data['id'] = this._id;
    data['email'] = this._email;
    data['name'] = this._name;
    return data;
  }
}

class EditUserResponse {
  bool? success;

  EditUserResponse({this.success});

  EditUserResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    return data;
  }
}