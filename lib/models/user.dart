class User {
  String? _name;
  int? _phone;
  String? _email;
  String? _image;
  String? _id;
  String? _surname;

  User(
      {String? name,
      int? phone,
      String? email,
      String? image,
      String? id,
      String? surname}) {
    if (name != null) {
      this._name = name;
    }
    if (phone != null) {
      this._phone = phone;
    }
    if (email != null) {
      this._email = email;
    }
    if (image != null) {
      this._image = image;
    }
    if (id != null) {
      this._id = id;
    }
    if (surname != null) {
      this._surname = surname;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  int? get phone => _phone;
  set phone(int? phone) => _phone = phone;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get id => _id;
  set id(String? id) => _id = id;
  String? get surname => _surname;
  set surname(String? surname) => _surname = surname;

  User.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _phone = json['phone'];
    _email = json['email'];
    _image = json['image'];
    _id = json['id'];
    _surname = json['surname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['phone'] = this._phone;
    data['email'] = this._email;
    data['image'] = this._image;
    data['id'] = this._id;
    data['surname'] = this._surname;
    return data;
  }
}

class GetUserRequest {
  String? id;

  GetUserRequest({this.id});

  GetUserRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}