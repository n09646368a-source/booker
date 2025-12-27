import 'dart:convert';

class ApartmentModel {
  final int id;
  final String location;
  final num rentPrice;
  final num salePrice;
  final num apartmentSpace;
  final int rooms;
  final int floor;
  final int bathrooms;
  

  ApartmentModel({
    required this.id,
    required this.location,
    required this.rentPrice,
    required this.salePrice,
    required this.apartmentSpace,
    required this.rooms,
    required this.floor,
    required this.bathrooms,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'location': location,
      'rent_price': rentPrice,
      'sale_price': salePrice,
      'apartment_space': apartmentSpace,
      'rooms': rooms,
      'floor': floor,
      'bathrooms': bathrooms,
    };
  }

  factory ApartmentModel.fromMap(Map<String, dynamic> map) {
    return ApartmentModel(
      id: (map['id'] is int)
          ? map['id'] as int
          : int.parse(map['id'].toString()),
      location: map['location'] as String,
      rentPrice: map['rent_price'] as num,
      salePrice: map['sale_price'] as num,
      apartmentSpace: map['apartment_space'] as num,
      rooms: (map['rooms'] is int)
          ? map['rooms'] as int
          : int.parse(map['rooms'].toString()),
      floor: (map['floor'] is int)
          ? map['floor'] as int
          : int.parse(map['floor'].toString()),
      bathrooms: (map['bathrooms'] is int)
          ? map['bathrooms'] as int
          : int.parse(map['bathrooms'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory ApartmentModel.fromJson(String source) =>
      ApartmentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
