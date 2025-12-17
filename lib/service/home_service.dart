import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/apartment_model.dart';

Dio dio = Dio();

Future<List<ApartmentModel>> getApartmentsList() async {
  try {
    Response response = await dio.get(
      "http://127.0.0.1:8000/api/index",
    );
    print(response.data);
    final listOfAPartmentsJson = response.data['data'] as List;
    final List<ApartmentModel> listOfAPartments = [];
    for (var jsonElement in listOfAPartmentsJson) {
      listOfAPartments.add(ApartmentModel.fromMap(jsonElement));
    }
    return listOfAPartments;
  } catch (e) {
    debugPrint(e.toString());
    return [];
  }
}


// {
//   "data": [
//     {
//       "image": "assets/images/apartment.jpeg",
//       "name": "Takatea Homestay",
//       "address": "JI,Tentar",
//       "price": {
//         "value": 120,
//         "unit": "night"
//       },
//       "rate": 4.5
//     },
//     {
//       "image": "assets/images/apartment.jpeg",
//       "name": "Takatea Homestay",
//       "address": "JI,Tentar",
//       "price": {
//         "value": 120,
//         "unit": "night"
//       },
//       "rate": 4.5
//     },
//     {
//       "image": "assets/images/apartment.jpeg",
//       "name": "Takatea Homestay",
//       "address": "JI,Tentar",
//       "price": {
//         "value": 120,
//         "unit": "night"
//       },
//       "rate": 4.5
//     },
//     {
//       "image": "assets/images/apartment.jpeg",
//       "name": "Takatea Homestay",
//       "address": "JI,Tentar",
//       "price": {
//         "value": 120,
//         "unit": "night"
//       },
//       "rate": 4.5
//     }
//   ]
// }