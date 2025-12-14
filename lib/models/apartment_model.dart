import 'dart:convert';

import 'package:flutter_application_6/models/price_model.dart';

class ApartmentModel {
  final String image;
  final String name;
  final String address;
  final num rate;
  final PriceModel price;

  ApartmentModel({
    required this.image,
    required this.name,
    required this.address,
    required this.rate,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'name': name,
      'address': address,
      'rate': rate,
      'price': price.toMap(),
    };
  }

  factory ApartmentModel.fromMap(Map<String, dynamic> map) {
    return ApartmentModel(
      image: map['image'] as String,
      name: map['name'] as String,
      address: map['address'] as String,
      rate: map['rate'] as num,
      price: PriceModel.fromMap(map['price'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ApartmentModel.fromJson(String source) =>
      ApartmentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
