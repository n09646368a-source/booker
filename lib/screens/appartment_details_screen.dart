import 'package:flutter/material.dart';
import '../models/apartment_model.dart';
import '../ui_components/detail_widget.dart';

class AppartmentDetailsScreen extends StatelessWidget {
  final ApartmentModel model;

  const AppartmentDetailsScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: const Text('Book Now'),
      ),
      appBar: AppBar(title: const Text('Details'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🖼 صورة الشقة
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                // model.image,
                'https://dummyimage.com/300/09f/fff.png',
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 12),

            // 🏠 العنوان + الأسعار
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    model.location,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Rent: \$${model.rentPrice}',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Sale: \$${model.salePrice}',
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 6),

            // 📍 العنوان
            Row(
              children: [
                const Icon(Icons.location_pin, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Expanded(child: Text(model.location)),
              ],
            ),

            const SizedBox(height: 20),

            // تفاصيل الشقة مبنية من حقول `ApartmentModel`
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 2.2,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                final items = [
                  {
                    'name': 'Space',
                    'value': '${model.apartmentSpace} m²',
                  },
                  {'name': 'Rooms', 'value': '${model.rooms}'},
                  {'name': 'Floor', 'value': '${model.floor}'},
                  {'name': 'Bathrooms', 'value': '${model.bathrooms}'},
                  {'name': 'Rent', 'value': '\$${model.rentPrice}'},
                  {'name': 'Sale', 'value': '\$${model.salePrice}'},
                ];

                final detail = items[index];

                return DetailWidget(
                  name: detail['name']!,
                  value: detail['value']!,
                  image: 'https://dummyimage.com/16/09f/fff.png',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
