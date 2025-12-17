/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_6/ui_components/apartment_widget.dart';

import '../bloc/home/home_bloc.dart';
import '../bloc/home/home_event.dart';
import '../bloc/home/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc()..add(const LoadApartments()),
      child: Scaffold(
        appBar: AppBar(title: Text('Home'), centerTitle: true
      
        
        ),
        
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading || state is HomeInitial) {
              return Center(
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (state is HomeLoaded) {
              final apartments = state.apartments;
              return ListView.separated(
                padding: EdgeInsets.all(12),
                itemBuilder: (context, index) =>
                    ApartmentWidget(model: apartments[index]),
                separatorBuilder: (context, index) => Divider(),
                itemCount: apartments.length,
              );
            }

            if (state is HomeError) {

              return Center(child: Text('Error: ${state.message}'));
            }

            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_6/ui_components/apartment_widget.dart';

import '../bloc/home/home_bloc.dart';
import '../bloc/home/home_event.dart';
import '../bloc/home/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc()..add(const LoadApartments()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Home'), centerTitle: true),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading || state is HomeInitial) {
              return const Center(
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (state is HomeLoaded) {
              final apartments = state.apartments;

              return Column(
                children: [
                  // 🔍 مربع البحث
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search apartment...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onChanged: (value) {
                        context.read<HomeBloc>().add(SearchApartments(value));
                      },
                    ),
                  ),

                  // 📃 لست الشقق
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      itemBuilder: (context, index) =>
                          ApartmentWidget(model: apartments[index]),
                      separatorBuilder: (_, __) => const Divider(),
                      itemCount: apartments.length,
                    ),
                  ),
                ],
              );
            }

            if (state is HomeError) {
              return Center(child: Text('Error: ${state.message}'));
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
