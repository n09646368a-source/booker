import 'package:flutter/material.dart';

class AppartmentDetailsScreen extends StatelessWidget {
  const AppartmentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(onPressed: () {}, child: null),
      appBar: AppBar(title: Text('Details'), centerTitle: true),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              spacing: 12,
              children: [
                SizedBox(
                  height: 200,
                  child: Image.asset('assets/images/apartment.jpeg'),
                ),
                Column(
                  spacing: 4,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("nour"), Text("310")],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
