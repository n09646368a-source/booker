import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/apartment_model.dart';

final Dio dio = Dio();

Future<List<ApartmentModel>> getApartmentsList() async {
  try {
    final response = await dio.get("http://127.0.0.1:8000/api/index");
    final listOfAPartmentsJson = response.data['data'] as List;
    return listOfAPartmentsJson
        .map((e) => ApartmentModel.fromMap(e))
        .toList();
  } catch (e) {
    debugPrint(e.toString());
    return [];
  }
}

Future<List<ApartmentModel>> getFilteredApartments(
  double? minPrice,
  double? maxPrice,
  int? rooms,
  String? city,
  String? governorate,
  String? query,
) async {
  try {
    final params = <String, dynamic>{};
    if (minPrice != null) params['min_price'] = minPrice;
    if (maxPrice != null) params['max_price'] = maxPrice;
    if (rooms != null) params['rooms'] = rooms;
    if (city != null && city.isNotEmpty) params['city'] = city;
    if (governorate != null && governorate.isNotEmpty) params['governorate'] = governorate;
    if (query != null && query.isNotEmpty) params['q'] = query;

    final response = await dio.get(
      "http://127.0.0.1:8000/api/index",
      queryParameters: params.isEmpty ? null : params,
    );

    final listOfAPartmentsJson = response.data['data'] as List;
    return listOfAPartmentsJson
        .map((e) => ApartmentModel.fromMap(e))
        .toList();
  } catch (e) {
    debugPrint(e.toString());
    return [];
  }
}

Future<Map<String, List<String>>> getLocations() async {
  try {
    final response = await dio.get("http://127.0.0.1:8000/api/locations");
    final data = response.data['data'];

    final Map<String, List<String>> result = {};

    if (data is Map) {
      data.forEach((k, v) {
        if (v is List) result[k.toString()] = v.map((e) => e.toString()).toList();
      });
    } else if (data is List) {
      for (final item in data) {
        final gov = item['governorate'] ?? item['name'] ?? item['gov'];
        final citiesRaw = item['cities'] ?? item['cities_list'] ?? [];
        final cities = (citiesRaw is List) ? citiesRaw.map((c) => c.toString()).toList() : <String>[];
        if (gov != null) result[gov.toString()] = cities;
      }
    }

    return result;
  } catch (e) {
    debugPrint(e.toString());
    return {};
  }
}