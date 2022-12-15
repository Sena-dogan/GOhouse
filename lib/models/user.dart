class UserData {

  late String uid;
  late String name;
  late String surname;
  late String email;
  late String password;
  late int phone;
  late String image;

  UserData({
    required this.uid,
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.phone,
    required this.image,
  });

  Map <String, dynamic> toJson() => {
    'uid': uid,
    'name': name,
    'surname': surname,
    'email': email,
    'password': password,
    'phone': phone,
    'image': image,
  };

}
