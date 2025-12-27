import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadApartments extends HomeEvent {
  const LoadApartments();
}

class SearchApartments extends HomeEvent {
  final String query;

  const SearchApartments(this.query);

  @override
  List<Object?> get props => [query];
}

class FilterApartments extends HomeEvent {
  final double? minPrice;
  final double? maxPrice;
  final int? rooms;
  final String? governorate;
  final String? city;

  const FilterApartments({
    this.minPrice,
    this.maxPrice,
    this.rooms,
    this.governorate,
    this.city,
  });

  @override
  List<Object?> get props => [minPrice, maxPrice, rooms, governorate, city];
}