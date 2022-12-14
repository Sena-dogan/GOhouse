class UserData {
  UserData._();

  static String? uid;
  static String? name;
  static String? surname;
  static String? email;
  static String? password;
  static int? phone;
  static String? image;

  UserData.fromMap(Map<String, dynamic> data) {
    uid = data['uid'];
    name = data['name'];
    surname = data['surname'];
    email = data['email'];
    phone = data['phone'];
    image = data['image'];
  }
}
