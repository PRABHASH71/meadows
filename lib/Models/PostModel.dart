import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meadows/widgets/Post.dart';

Postmodel PostmodelFromJson(String str) => Postmodel.fromJson(json.decode(str));

String PostmodelToJson(Postmodel data) => json.encode(data.toJson());

class Postmodel {
  String? id;
  String? dp;
  String? image;
  String? user;
  String? caption;
  String? category;
  Timestamp? date;
  List? likes;
  List? comments;
  Postmodel(
      {this.id,
      this.caption,
      this.image,
      this.category,
      this.date,
      this.likes,
      this.user,
      this.comments});
  factory Postmodel.fromJson(map) {
    return Postmodel(
        id: map['id'],
        caption: map['caption'],
        image: map['image'],
        category: map['category'],
        date: map['date'],
        likes: map['likes'],
        user: map['user'],
        comments: map['comments']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': 'id',
      'caption': caption,
      'image': image,
      'category': category,
      'date': date,
      'likes': likes,
      'user': user,
      'comments': comments,
    };
  }

  Postmodel copyWith({
    String? caption,
    String? image,
    String? user,
    Timestamp? date,
    String? category,
  }) =>
      Postmodel(
        image: image ?? this.image,
        caption: caption ?? this.caption,
        date: date ?? this.date,
        category: category,
        likes: likes,
        comments: comments,
      );
}
