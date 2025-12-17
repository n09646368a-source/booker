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
  final Map<String, dynamic> filters;

  const FilterApartments(this.filters);

  @override
  List<Object?> get props => [filters];
}