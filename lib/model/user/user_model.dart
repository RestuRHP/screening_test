// To parse this JSON data, do
//
//     final userListModel = userListModelFromJson(jsonString);



class UserListModel {
  UserListModel({
    required this.data,
  });

  List<UserModel> data;


  factory UserListModel.fromJson(Map<String, dynamic> json) => UserListModel(
    data: List<UserModel>.from(json["data"].map((x) => UserModel.fromJson(x))),
  );

  //

}

class UserModel {
  UserModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "avatar": avatar,
  };
}
