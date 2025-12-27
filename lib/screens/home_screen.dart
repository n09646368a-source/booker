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
}*//*
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
                        prefixIcon: const Icon(Icons.search,color: Color.fromARGB(255, 142, 25, 210),),
//من هون
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.filter_list),
                          tooltip: 'Filter',
                          onPressed: () {
                            showModalBottomSheet<void>(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) {
                                final minController = TextEditingController();
                                final maxController = TextEditingController();
                                final roomsController = TextEditingController();
                                final locationController = TextEditingController();

                                return Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).viewInsets.bottom,
                                  ),
                                  child: StatefulBuilder(
                                    builder: (context, setState) => Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text('Filter options', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                                              IconButton(
                                                icon: const Icon(Icons.close),
                                                onPressed: () => Navigator.of(context).pop(),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 12),

                                          TextField(
                                            controller: minController,
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            decoration: const InputDecoration(labelText: 'Min price'),
                                          ),
                                          const SizedBox(height: 8),
                                          TextField(
                                            controller: maxController,
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            decoration: const InputDecoration(labelText: 'Max price'),
                                          ),
                                          const SizedBox(height: 8),
                                          TextField(
                                            controller: roomsController,
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(labelText: 'Rooms'),
                                          ),
                                          const SizedBox(height: 8),
                                          TextField(
                                            controller: locationController,
                                            decoration: const InputDecoration(labelText: 'Location'),
                                          ),
                                          const SizedBox(height: 16),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  minController.clear();
                                                  maxController.clear();
                                                  roomsController.clear();
                                                  locationController.clear();
                                                  context.read<HomeBloc>().add(const FilterApartments());
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Reset'),
                                              ),
                                              const SizedBox(width: 8),
                                              ElevatedButton(
                                                onPressed: () {
                                                  final min = double.tryParse(minController.text);
                                                  final max = double.tryParse(maxController.text);
                                                  final rooms = int.tryParse(roomsController.text);
                                                  final location = locationController.text.isEmpty ? null : locationController.text;

                                                  context.read<HomeBloc>().add(FilterApartments(
                                                        minPrice: min,
                                                        maxPrice: max,
                                                        rooms: rooms,
                                                        location: location,
                                                      ));

                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Apply'),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),//هون
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onChanged: (value) {
                        context.read<HomeBloc>().add(SearchApartments(value));
                      },
                    
                    ),
                  ),

                  
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
}*/import 'package:flutter/material.dart';
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
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search apartment...',
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 142, 25, 210),
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.filter_list),
                          tooltip: 'Filter',
                          onPressed: () {
                            showModalBottomSheet<void>(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) {
                                // sample governorates & cities - replace or extend as needed
                                final Map<String, List<String>> governorateCities = {
                                  'Cairo': ['Nasr City', 'Heliopolis', 'Downtown'],
                                  'Giza': ['Dokki', 'Mohandessin', '6th of October'],
                                  'Alexandria': ['Stanley', 'Smouha', 'Roushdy'],
                                };

                                final governorates = governorateCities.keys.toList();

                                final minController = TextEditingController();
                                final maxController = TextEditingController();
                                final searchRoomsController = TextEditingController();

                                RangeValues priceRange = const RangeValues(0, 10000000000);
                                int? selectedRooms;
                                String? selectedGovernorate;
                                String? selectedCity;
                                int selectedRating = 0;

                                return Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).viewInsets.bottom,
                                  ),
                                  child: StatefulBuilder(
                                    builder: (context, setState) => Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                'Filter options',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.close),
                                                onPressed: () => Navigator.of(context).pop(),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 12),

                                          // Price range
                                          const Text('Price range', style: TextStyle(fontWeight: FontWeight.w500)),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                                            child: RangeSlider(
                                              values: priceRange,
                                              min: 0,
                                              max: 20000000000,
                                              divisions: 40,
                                              labels: RangeLabels(
                                                priceRange.start.round().toString(),
                                                priceRange.end.round().toString(),
                                              ),
                                              onChanged: (r) {
                                                setState(() {
                                                  priceRange = r;
                                                  minController.text = priceRange.start.round().toString();
                                                  maxController.text = priceRange.end.round().toString();
                                                });
                                              },
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextField(
                                                  controller: minController,
                                                  keyboardType: TextInputType.number,
                                                  decoration: const InputDecoration(labelText: 'Min'),
                                                  onChanged: (v) {
                                                    final val = double.tryParse(v) ?? priceRange.start;
                                                    setState(() {
                                                      priceRange = RangeValues(
                                                        val.clamp(0, priceRange.end),
                                                        priceRange.end,
                                                      );
                                                    });
                                                  },
                                                ),
                                              ),
                                              const SizedBox(width: 12),
                                              Expanded(
                                                child: TextField(
                                                  controller: maxController,
                                                  keyboardType: TextInputType.number,
                                                  decoration: const InputDecoration(labelText: 'Max'),
                                                  onChanged: (v) {
                                                    final val = double.tryParse(v) ?? priceRange.end;
                                                    setState(() {
                                                      priceRange = RangeValues(
                                                        priceRange.start,
                                                        val.clamp(priceRange.start, 20000),
                                                      );
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 12),

                                          // Governorate -> City
                                          const Text('Location', style: TextStyle(fontWeight: FontWeight.w500)),
                                          const SizedBox(height: 8),
                                          DropdownButtonFormField<String>(
                                            decoration: const InputDecoration(labelText: 'Governorate'),
                                            items: governorates
                                                .map((g) => DropdownMenuItem(
                                                      value: g,
                                                      child: Text(g),
                                                    ))
                                                .toList(),
                                            value: selectedGovernorate,
                                            onChanged: (val) {
                                              setState(() {
                                                selectedGovernorate = val;
                                                selectedCity = null;
                                              });
                                            },
                                          ),
                                          const SizedBox(height: 8),
                                          DropdownButtonFormField<String>(
                                            decoration: const InputDecoration(labelText: 'City (optional)'),
                                            items: (selectedGovernorate != null
                                                    ? governorateCities[selectedGovernorate] ?? []
                                                    : <String>[])
                                                .map((c) => DropdownMenuItem(
                                                      value: c,
                                                      child: Text(c),
                                                    ))
                                                .toList(),
                                            value: selectedCity,
                                            onChanged: (val) {
                                              setState(() {
                                                selectedCity = val;
                                              });
                                            },
                                          ),
                                          const SizedBox(height: 12),

                                          // Bedrooms selector
                                          const Text('Bedrooms', style: TextStyle(fontWeight: FontWeight.w500)),
                                          const SizedBox(height: 6),
                                          Row(
                                            children: [
                                              const Text('Any'),
                                              const SizedBox(width: 12),
                                              DropdownButton<int?>(
                                                value: selectedRooms,
                                                hint: const Text('Select bedrooms'),
                                                items: <int?>[null, 1, 2, 3, 4, 5]
                                                    .map((n) => DropdownMenuItem<int?>(
                                                          value: n,
                                                          child: Text(n == null ? 'Any' : n.toString()),
                                                        ))
                                                    .toList(),
                                                onChanged: (val) {
                                                  setState(() {
                                                    selectedRooms = val;
                                                    searchRoomsController.text = val?.toString() ?? '';
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 12),

                                          // Rating selector (UI-only)
                                          const Text('Minimum rating', style: TextStyle(fontWeight: FontWeight.w500)),
                                          const SizedBox(height: 6),
                                          Row(
                                            children: List.generate(5, (i) {
                                              final starIndex = i + 1;
                                              return IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    selectedRating = (selectedRating == starIndex) ? 0 : starIndex;
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.star,
                                                  color: starIndex <= selectedRating ? Colors.amber : Colors.grey.shade400,
                                                ),
                                              );
                                            }),
                                          ),
                                          const SizedBox(height: 16),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  minController.clear();
                                                  maxController.clear();
                                                  searchRoomsController.clear();
                                                  setState(() {
                                                    priceRange = const RangeValues(0, 100000000000);
                                                    selectedGovernorate = null;
                                                    selectedCity = null;
                                                    selectedRooms = null;
                                                    selectedRating = 0;
                                                  });
                                                  context.read<HomeBloc>().add(const FilterApartments());
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Reset'),
                                              ),
                                              const SizedBox(width: 8),
                                              ElevatedButton(
                                                onPressed: () {
                                                 /* final min = double.tryParse(minController.text) ?? priceRange.start;
                                                  final max = double.tryParse(maxController.text) ?? priceRange.end;
                                                  final rooms = selectedRooms;
                                                  final location = selectedCity ?? selectedGovernorate;

                                                  context.read<HomeBloc>().add(FilterApartments(
                                                    minPrice: min,
                                                    maxPrice: max,
                                                    badrooms: rooms,
                                                    governorate: location,
                                                    citise: location
                                                  ));
*/final min = double.tryParse(minController.text) ?? priceRange.start;
final max = double.tryParse(maxController.text) ?? priceRange.end;
final rooms = selectedRooms;
final locationGovernorate = selectedGovernorate;
final locationCity = selectedCity;

context.read<HomeBloc>().add(FilterApartments(
  minPrice: min,
  maxPrice: max,
  rooms: rooms,
  governorate: locationGovernorate,
  city: locationCity,
));
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Apply'),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ), // end suffixIcon
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onChanged: (value) {
                        context.read<HomeBloc>().add(SearchApartments(value));
                      },
                    ),
                  ),

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
