import 'package:flutter/material.dart';
import 'package:flutter_application_6/service/home_service.dart';
import 'package:flutter_application_6/ui_components/apartment_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'), centerTitle: true),
      body: FutureBuilder(
        future: getApartmentsList(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState != ConnectionState.done) {
            return Center(
              child: SizedBox(
                height: 60,
                width: 60,
                child: CircularProgressIndicator(),
              ),
            );
          }
          return ListView.separated(
            padding: EdgeInsets.all(12),
            itemBuilder: (context, index) =>
                ApartmentWidget(model: asyncSnapshot.data![index]),
            separatorBuilder: (context, index) => Divider(),
            itemCount: asyncSnapshot.data!.length,
          );
        },
      ),
    );
  }
}
