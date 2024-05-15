import 'dart:convert';
import 'package:get/get.dart';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

class Product {
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    //required this.rating,
  });
  late final int id;
  late final String title;
  late final double price;
  late final String description;
  late final String category;
  late final String image;
  //late final Rating rating;

  RxBool isFavorite = RxBool(false);

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];

    if (json['price'] is int) {
      price = json['price'].toDouble();
    } else {
      price = json['price'];
    }

    description = json['description'];
    category = json['category'];
    image = json['image'];
    //rating = Rating.fromJson(json['rating']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['price'] = price;
    _data['description'] = description;
    _data['category'] = category;
    _data['image'] = image;
    //_data['rating'] = rating.toJson();
    return _data;
  }
}

// class Rating {
//   Rating({
//     required this.rate,
//     required this.count,
//   });
//   late final double rate;
//   late final int count;
//
//   Rating.fromJson(Map<String, dynamic> json) {
//     rate = json['rate'];
//     count = json['count'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['rate'] = rate;
//     _data['count'] = count;
//     return _data;
//   }
// }
