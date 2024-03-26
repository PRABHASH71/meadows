import 'dart:convert';

Usermodel usermodelFromJson(String str) => Usermodel.fromJson(json.decode(str));

String usermodelToJson(Usermodel data) => json.encode(data.toJson());

class Usermodel {
  String? image;
  String? id;
  String? name;
  String? email;
  String? userid;
  String? bio;
  Usermodel(
      {this.id, this.image, this.name, this.email, this.userid, this.bio});
  factory Usermodel.fromJson(map) {
    return Usermodel(
        id: map['id'],
        image: map['image'],
        name: map['name'],
        email: map['email'],
        userid: map['userid'],
        bio: map['bio']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'email': email,
      'name': name,
      'userid': userid,
      'bio': bio,
    };
  }

  Usermodel copyWith({
    String? name,
    String? image,
    String? userid,
    String? bio,
  }) =>
      Usermodel(
        image: image ?? this.image,
        id: id,
        email: email,
        name: name ?? this.name,
        userid: userid ?? this.userid,
        bio: bio ?? this.bio,
      );
}
