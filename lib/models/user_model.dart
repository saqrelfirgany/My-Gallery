class UserModel {
  dynamic id;
  dynamic name;
  dynamic email;

  UserModel({this.id, this.name});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }
}