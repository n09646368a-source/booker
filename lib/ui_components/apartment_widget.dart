import 'package:flutter/material.dart';
import 'package:flutter_application_6/screens/appartment_details_screen.dart';

import '../models/apartment_model.dart';

class ApartmentWidget extends StatelessWidget {
  const ApartmentWidget({super.key, required this.model});
  final ApartmentModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AppartmentDetailsScreen(model: model)),
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              // model.image,
              'https://dummyimage.com/80x60/09f/fff.png'
              ,
              width: 80,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8),
          Column(
            spacing: 2,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.id.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Icon(Icons.location_pin, size: 12, color: Colors.black45),
                  SizedBox(width: 6),
                  Text(model.location, style: TextStyle(color: Colors.black45)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${model.rentPrice} ',//${model.price.unit}',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(width: 100),
                //  Text('⭐️${model.rate}', style: TextStyle(fontSize: 10)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
