// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));
List<Product> productsFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.name,
    this.description,
    this.imageUrl,
    this.rating,
    this.numberOfRating,
    this.price,
    this.slug,
  });

  String name;
  String description;
  String imageUrl;
  String rating;
  String numberOfRating;
  int price;
  String slug;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        rating: json["rating"],
        numberOfRating: json["numberOfRating"],
        price: json["price"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "imageUrl": imageUrl,
        "rating": rating,
        "numberOfRating": numberOfRating,
        "price": price,
        "slug": slug,
      };
}
