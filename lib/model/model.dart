class AuthModel {
  bool? status;
  String? message;
  UserDataAuth? data;
  AuthModel.fromJson(Map<String, dynamic>? json) {
    status = json!['status'];
    message = json['message'];
    data = json['data'] == null ? null : UserDataAuth.fromJson(json['data']);
  }
}

class UserDataAuth {
  int? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? image;
  String? token;
  UserDataAuth.fromJson(Map<String, dynamic>? json) {
    id = json!['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    image = json['image'];
    token = json['token'];
  }
}
